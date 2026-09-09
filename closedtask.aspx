<%@ Page Title="Completed Tasks" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server" language="C#" type="text/c#">
    protected int totalCompletedCount = 0;
    protected int dailyCompletedCount = 0;
    protected int periodicCompletedCount = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadStats();

        if (!IsPostBack)
        {
            string typeParam = Request.QueryString["type"];
            if (!string.IsNullOrEmpty(typeParam) && typeParam.ToLower() == "daily")
            {
                ddlFrequencyFilter.SelectedValue = "Daily";
            }
            BindCompletedTasks();
            BindLeaSummary();
        }
    }

    private void LoadStats()
    {
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = @"
                SELECT 
                    COUNT(*) AS TotalCompleted,
                    COUNT(CASE WHEN COALESCE(f.Frequency, s.Frequency) = 'Daily' THEN 1 END) AS DailyCompleted,
                    COUNT(CASE WHEN COALESCE(f.Frequency, s.Frequency) <> 'Daily' OR COALESCE(f.Frequency, s.Frequency) IS NULL THEN 1 END) AS PeriodicCompleted
                FROM dbo.FormData_V2 f
                LEFT JOIN dbo.Schedule_V2 s ON f.Sc_ID = s.ID
                WHERE f.Status IN ('Closed', 'Completed', 'Close')";

            using (SqlCommand cmd = new SqlCommand(sql, conn))
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                if (r.Read())
                {
                    totalCompletedCount = Convert.ToInt32(r["TotalCompleted"]);
                    dailyCompletedCount = Convert.ToInt32(r["DailyCompleted"]);
                    periodicCompletedCount = Convert.ToInt32(r["PeriodicCompleted"]);
                }
            }
        }
    }

    private void BindCompletedTasks()
    {
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = @"
                SELECT 
                    f.ID,
                    CASE 
                        WHEN l.LEA_Name IS NOT NULL AND l.LEA_Name <> '' AND l.LEA_Name <> 'NULL' THEN l.LEA_Name 
                        ELSE ISNULL(s.LEA, 'Unknown') 
                    END AS LEA_Name,
                    COALESCE(s.Platform, f.Platform) AS Platform,
                    COALESCE(f.Node_Name, s.Node_Name) AS Node_Name,
                    f.Maintenance_Task,
                    COALESCE(f.Frequency, s.Frequency) AS Frequency,
                    f.Scheduled_Date,
                    f.End_Date,
                    COALESCE(f.Completed_on, f.Updated_on, f.End_Date) AS Completed_On,
                    f.Status,
                    f.Remark
                FROM dbo.FormData_V2 f
                LEFT JOIN dbo.Schedule_V2 s ON f.Sc_ID = s.ID
                LEFT JOIN dbo.Lea2 l ON s.LEA = l.LEA
                WHERE f.Status IN ('Closed', 'Completed', 'Close')";

            string freqFilter = ddlFrequencyFilter.SelectedValue;
            if (freqFilter == "Daily")
            {
                sql += " AND COALESCE(f.Frequency, s.Frequency) = 'Daily'";
            }
            else if (freqFilter == "Periodic")
            {
                sql += " AND (COALESCE(f.Frequency, s.Frequency) <> 'Daily' OR COALESCE(f.Frequency, s.Frequency) IS NULL)";
            }

            string platFilter = ddlPlatformFilter.SelectedValue;
            if (!string.IsNullOrEmpty(platFilter) && platFilter != "All")
            {
                sql += " AND COALESCE(s.Platform, f.Platform) = @Platform";
            }

            string search = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(search))
            {
                sql += " AND (f.Node_Name LIKE @Search OR f.Maintenance_Task LIKE @Search OR l.LEA_Name LIKE @Search)";
            }

            sql += " ORDER BY f.Completed_on DESC, f.ID ASC";

            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                if (!string.IsNullOrEmpty(platFilter) && platFilter != "All")
                {
                    cmd.Parameters.AddWithValue("@Platform", platFilter);
                }
                if (!string.IsNullOrEmpty(search))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + search + "%");
                }

                DataTable dt = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }

                gvCompletedTasks.DataSource = dt;
                gvCompletedTasks.DataBind();
                lblTasksFoundCount.Text = dt.Rows.Count.ToString();
                pnlNoRecords.Visible = (dt.Rows.Count == 0);
            }
        }
    }

    private void BindLeaSummary()
    {
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = @"
                SELECT 
                    CASE 
                        WHEN l.LEA_Name IS NOT NULL AND l.LEA_Name <> '' AND l.LEA_Name <> 'NULL' THEN l.LEA_Name 
                        ELSE ISNULL(s.LEA, 'Unknown') 
                    END AS LEA_Name,
                    COUNT(CASE WHEN COALESCE(f.Frequency, s.Frequency) = 'Daily' THEN 1 END) AS Daily_Completed,
                    COUNT(CASE WHEN COALESCE(f.Frequency, s.Frequency) <> 'Daily' OR COALESCE(f.Frequency, s.Frequency) IS NULL THEN 1 END) AS Periodic_Completed,
                    COUNT(*) AS Total_Completed
                FROM dbo.FormData_V2 f
                LEFT JOIN dbo.Schedule_V2 s ON f.Sc_ID = s.ID
                LEFT JOIN dbo.Lea2 l ON s.LEA = l.LEA
                WHERE f.Status IN ('Closed', 'Completed', 'Close')
                GROUP BY 
                    CASE 
                        WHEN l.LEA_Name IS NOT NULL AND l.LEA_Name <> '' AND l.LEA_Name <> 'NULL' THEN l.LEA_Name 
                        ELSE ISNULL(s.LEA, 'Unknown') 
                    END
                ORDER BY Total_Completed DESC, LEA_Name ASC";

            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
                gvLeaSummary.DataSource = dt;
                gvLeaSummary.DataBind();
            }
        }
    }

    protected void FilterChanged(object sender, EventArgs e)
    {
        gvCompletedTasks.PageIndex = 0;
        BindCompletedTasks();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        gvCompletedTasks.PageIndex = 0;
        BindCompletedTasks();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ddlFrequencyFilter.SelectedValue = "Daily";
        ddlPlatformFilter.SelectedValue = "All";
        txtSearch.Text = "";
        gvCompletedTasks.PageIndex = 0;
        BindCompletedTasks();
    }

    protected void gvCompletedTasks_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvCompletedTasks.PageIndex = e.NewPageIndex;
        BindCompletedTasks();
    }

    protected string GetPlatformBadgeClass(object platObj)
    {
        if (platObj == null) return "plat-badge plat-other";
        string plat = platObj.ToString().Trim().ToUpperInvariant();
        switch (plat)
        {
            case "ITMC": return "plat-badge plat-itmc";
            case "SMW4": return "plat-badge plat-smw4";
            case "DSCN": return "plat-badge plat-dscn";
            case "BLCS": return "plat-badge plat-blcs";
            default: return "plat-badge plat-other";
        }
    }

    protected string FormatMaintenanceTasks(object taskObj)
    {
        if (taskObj == null || taskObj == DBNull.Value) return "";
        string taskStr = taskObj.ToString();
        if (string.IsNullOrEmpty(taskStr)) return "";

        string[] tasks = taskStr.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);
        if (tasks.Length <= 1)
        {
            return Server.HtmlEncode(taskStr.Trim());
        }

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<div class='subtask-list'>");
        for (int i = 0; i < tasks.Length; i++)
        {
            string t = tasks[i].Trim();
            if (!string.IsNullOrEmpty(t))
            {
                sb.Append("<div class='subtask-item'>");
                sb.Append("<span class='subtask-bullet'>&bull;</span> ");
                sb.Append(Server.HtmlEncode(t));
                sb.Append("</div>");
            }
        }
        sb.Append("</div>");
        return sb.ToString();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Completed Tasks - International Maintenance
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .completed-wrapper {
            padding: 15px 25px 40px 25px;
            font-family: "Segoe UI", -apple-system, BlinkMacSystemFont, Arial, sans-serif;
            background-color: #f7f9fc;
            min-height: 850px;
        }

        /* Top Header */
        .completed-header-box {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 16px 20px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 12px;
        }
        .completed-title {
            color: #0f2744;
            font-size: 22px;
            font-weight: 700;
            margin: 0;
            display: inline-block;
        }
        .badge-pill-main {
            background-color: #16a34a;
            color: #ffffff;
            font-size: 11px;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 12px;
            margin-left: 8px;
            vertical-align: middle;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .completed-subtitle {
            color: #64748b;
            font-size: 13px;
            margin-top: 4px;
        }

        /* KPI Metric Cards */
        .kpi-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(210px, 1fr));
            gap: 16px;
            margin-bottom: 20px;
        }
        .kpi-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 14px 18px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04);
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .kpi-card.highlight-daily {
            border-left: 4px solid #16a34a;
            background: linear-gradient(to right, #f0fdf4, #ffffff);
        }
        .kpi-card.highlight-total {
            border-left: 4px solid #2563eb;
        }
        .kpi-card.highlight-periodic {
            border-left: 4px solid #8b5cf6;
        }
        .kpi-icon {
            width: 42px;
            height: 42px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: bold;
        }
        .kpi-icon-daily {
            background-color: #dcfce7;
            color: #15803d;
        }
        .kpi-icon-total {
            background-color: #dbeafe;
            color: #1d4ed8;
        }
        .kpi-icon-periodic {
            background-color: #f3e8ff;
            color: #7e22ce;
        }
        .kpi-label {
            font-size: 11.5px;
            color: #64748b;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .kpi-value {
            font-size: 24px;
            font-weight: 800;
            color: #0f172a;
            line-height: 1.2;
        }
        .kpi-note {
            font-size: 11px;
            color: #16a34a;
            font-weight: 600;
        }

        /* Filter Box */
        .filter-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 12px 18px;
            margin-bottom: 18px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.03);
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: center;
            justify-content: space-between;
        }
        .filter-group {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }
        .filter-label {
            font-size: 12px;
            font-weight: 700;
            color: #334155;
        }
        .filter-select {
            padding: 5px 10px;
            font-size: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            background-color: #ffffff;
            color: #0f172a;
        }
        .filter-input {
            padding: 5px 10px;
            font-size: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            min-width: 190px;
        }

        /* Card Section */
        .content-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.06);
            overflow: hidden;
            margin-bottom: 25px;
        }
        .content-card-header {
            background: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            padding: 12px 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }
        .content-card-title {
            font-size: 15px;
            font-weight: 700;
            color: #1e293b;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .content-card-body {
            padding: 15px;
        }

        /* Buttons */
        .btn-action-primary {
            background-color: #2461BF;
            color: #ffffff;
            border: none;
            padding: 6px 14px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            transition: background 0.15s;
        }
        .btn-action-primary:hover {
            background-color: #1d4ed8;
            color: #ffffff;
            text-decoration: none;
        }
        .btn-action-secondary {
            background-color: #f1f5f9;
            color: #334155;
            border: 1px solid #cbd5e1;
            padding: 5px 12px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        .btn-action-secondary:hover {
            background-color: #e2e8f0;
            color: #0f172a;
        }
        .btn-fill-task {
            background-color: #0284c7;
            color: #ffffff;
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 11px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            white-space: nowrap;
        }
        .btn-fill-task:hover {
            background-color: #0369a1;
            color: #ffffff;
            text-decoration: none;
        }

        /* Badges */
        .plat-badge {
            display: inline-block;
            padding: 2px 7px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }
        .plat-itmc { background-color: #e0f2fe; color: #0369a1; border: 1px solid #bae6fd; }
        .plat-smw4 { background-color: #dcfce7; color: #15803d; border: 1px solid #bbf7d0; }
        .plat-dscn { background-color: #ffedd5; color: #c2410c; border: 1px solid #fed7aa; }
        .plat-blcs { background-color: #f3e8ff; color: #7e22ce; border: 1px solid #e9d5ff; }
        .plat-other { background-color: #f1f5f9; color: #475569; border: 1px solid #e2e8f0; }

        .freq-badge {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 10.5px;
            font-weight: 600;
        }
        .freq-daily {
            background-color: #e0f2fe;
            color: #0284c7;
            border: 1px solid #bae6fd;
        }
        .freq-periodic {
            background-color: #f1f5f9;
            color: #475569;
            border: 1px solid #cbd5e1;
        }

        .status-badge-closed {
            background-color: #dcfce7;
            color: #15803d;
            border: 1px solid #bbf7d0;
            padding: 2px 7px;
            border-radius: 4px;
            font-size: 10.5px;
            font-weight: 700;
        }

        /* Grid Table Styling */
        .custom-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 12.5px;
        }
        .custom-grid th {
            background-color: #334155;
            color: #ffffff;
            font-weight: 600;
            padding: 8px 10px;
            font-size: 12px;
            text-align: left;
        }
        .custom-grid td {
            padding: 7px 10px;
            border-bottom: 1px solid #e2e8f0;
            color: #334155;
            vertical-align: middle;
        }
        .custom-grid tr:hover {
            background-color: #f8fafc;
        }
        .node-link {
            color: #1d4ed8;
            font-weight: 700;
            text-decoration: none;
        }
        .node-link:hover {
            text-decoration: underline;
            color: #0f2744;
        }

        /* Subtasks */
        .subtask-list {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }
        .subtask-item {
            font-size: 12px;
            line-height: 1.35;
        }
        .subtask-bullet {
            color: #2563eb;
            font-weight: bold;
        }

        .no-records {
            text-align: center;
            padding: 30px;
            color: #64748b;
            font-size: 13.5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <div class="completed-wrapper">

        <!-- Top Header Bar -->
        <div class="completed-header-box">
            <div>
                <h2 class="completed-title">Completed Maintenance Tasks</h2>
                <span class="badge-pill-main">International Records</span>
                <div class="completed-subtitle">
                    Archive of completed routine maintenance checks across International platforms (ITMC, SMW4, DSCN, BLCS).
                </div>
            </div>
            <div>
                <a href="NewToDo.aspx" class="btn-action-primary">
                    &laquo; Back to International To Do
                </a>
            </div>
        </div>

        <!-- KPI Metric Cards -->
        <div class="kpi-row">
            <div class="kpi-card highlight-daily">
                <div class="kpi-icon kpi-icon-daily">&#10003;</div>
                <div>
                    <div class="kpi-label">Daily Completed Tasks</div>
                    <div class="kpi-value"><%= dailyCompletedCount %></div>
                    <div class="kpi-note">Moved from Daily Schedule</div>
                </div>
            </div>
            <div class="kpi-card highlight-periodic">
                <div class="kpi-icon kpi-icon-periodic">&#128197;</div>
                <div>
                    <div class="kpi-label">Periodic Completed Tasks</div>
                    <div class="kpi-value"><%= periodicCompletedCount %></div>
                    <div style="font-size: 11px; color: #64748b;">Monthly, Quarterly, Annual</div>
                </div>
            </div>
            <div class="kpi-card highlight-total">
                <div class="kpi-icon kpi-icon-total">&#128202;</div>
                <div>
                    <div class="kpi-label">Total International Completed</div>
                    <div class="kpi-value"><%= totalCompletedCount %></div>
                    <div style="font-size: 11px; color: #2563eb;">All Platforms</div>
                </div>
            </div>
        </div>

        <!-- Filter Bar -->
        <div class="filter-card">
            <div class="filter-group">
                <span class="filter-label">Frequency:</span>
                <asp:DropDownList ID="ddlFrequencyFilter" runat="server" CssClass="filter-select" AutoPostBack="True" OnSelectedIndexChanged="FilterChanged">
                    <asp:ListItem Text="-- Daily Tasks Only (Completed) --" Value="Daily" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="-- All Completed Tasks --" Value="All"></asp:ListItem>
                    <asp:ListItem Text="Periodic Tasks Only" Value="Periodic"></asp:ListItem>
                </asp:DropDownList>

                <span class="filter-label" style="margin-left: 10px;">Platform:</span>
                <asp:DropDownList ID="ddlPlatformFilter" runat="server" CssClass="filter-select" AutoPostBack="True" OnSelectedIndexChanged="FilterChanged">
                    <asp:ListItem Text="-- All Platforms --" Value="All"></asp:ListItem>
                    <asp:ListItem Text="SMW4" Value="SMW4"></asp:ListItem>
                    <asp:ListItem Text="DSCN" Value="DSCN"></asp:ListItem>
                    <asp:ListItem Text="ITMC" Value="ITMC"></asp:ListItem>
                    <asp:ListItem Text="BLCS" Value="BLCS"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="filter-group">
                <span class="filter-label">Search:</span>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="filter-input" placeholder="Search Node or Task..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Filter" CssClass="btn-action-primary" OnClick="btnSearch_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn-action-secondary" OnClick="btnReset_Click" />
            </div>
        </div>

        <!-- Main Completed Tasks Grid Card -->
        <div class="content-card">
            <div class="content-card-header">
                <div class="content-card-title">
                    <span>Completed Maintenance Task Records</span>
                    <span style="font-size: 11px; font-weight: bold; background: #2461BF; color: #ffffff; padding: 2px 8px; border-radius: 10px;">
                        <asp:Label ID="lblTasksFoundCount" runat="server" Text="0"></asp:Label> Records
                    </span>
                </div>
                <div style="font-size: 11.5px; color: #64748b;">
                    Click any <b>Node Name</b> or <b>View Form</b> to inspect form observations & measurements.
                </div>
            </div>

            <div class="content-card-body" style="padding: 0;">
                <asp:Panel ID="pnlNoRecords" runat="server" Visible="False">
                    <div class="no-records">
                        <b>No completed tasks found matching your filter selection.</b>
                    </div>
                </asp:Panel>

                <asp:GridView ID="gvCompletedTasks" runat="server" AutoGenerateColumns="False" 
                    AllowPaging="True" PageSize="25" OnPageIndexChanging="gvCompletedTasks_PageIndexChanging"
                    CssClass="custom-grid" GridLines="None" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="45px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                        <asp:TemplateField HeaderText="Platform" ItemStyle-Width="70px">
                            <ItemTemplate>
                                <span class='<%# GetPlatformBadgeClass(Eval("Platform")) %>'>
                                    <%# Eval("Platform") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Node & LEA">
                            <ItemTemplate>
                                <div>
                                    <a class="node-link" href='<%# "NewMaintenanceForm.aspx?Form_ID=" + Eval("ID") + "&Node_Name=" + Server.UrlEncode(Eval("Node_Name").ToString()) + "&Platform=" + Server.UrlEncode(Eval("Platform").ToString()) + "&LEA_Name=" + Server.UrlEncode(Eval("LEA_Name").ToString()) + "&Frequency=" + Server.UrlEncode(Eval("Frequency").ToString()) + "&End_Date=" + Server.UrlEncode(Eval("End_Date", "{0:yyyy-MM-dd}")) %>' title="Click to view maintenance form">
                                        <%# Eval("Node_Name") %>
                                    </a>
                                </div>
                                <div style="font-size: 11px; color: #64748b; margin-top: 2px;">
                                    LEA: <b><%# Eval("LEA_Name") %></b>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Maintenance Task">
                            <ItemTemplate>
                                <div style="font-size: 12px; color: #334155; line-height: 1.35;">
                                    <%# FormatMaintenanceTasks(Eval("Maintenance_Task")) %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Frequency" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <span class='<%# Eval("Frequency").ToString() == "Daily" ? "freq-badge freq-daily" : "freq-badge freq-periodic" %>'>
                                    <%# Eval("Frequency") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Scheduled_Date" HeaderText="Scheduled Date" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="95px" />
                        <asp:BoundField DataField="Completed_On" HeaderText="Completed On" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="95px" ItemStyle-Font-Bold="True" />
                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <span class="status-badge-closed">
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="80px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <a class="btn-fill-task" href='<%# "NewMaintenanceForm.aspx?Form_ID=" + Eval("ID") + "&Node_Name=" + Server.UrlEncode(Eval("Node_Name").ToString()) + "&Platform=" + Server.UrlEncode(Eval("Platform").ToString()) + "&LEA_Name=" + Server.UrlEncode(Eval("LEA_Name").ToString()) + "&Frequency=" + Server.UrlEncode(Eval("Frequency").ToString()) + "&End_Date=" + Server.UrlEncode(Eval("End_Date", "{0:yyyy-MM-dd}")) %>'>
                                    View Form &raquo;
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#f8fafc" ForeColor="#1e293b" HorizontalAlign="Right" Height="38px" />
                </asp:GridView>
            </div>
        </div>

        <!-- Summary by LEA Collapsible Card -->
        <div class="content-card">
            <div class="content-card-header">
                <div class="content-card-title">
                    <span>Completed Tasks Summary by LEA</span>
                </div>
            </div>
            <div class="content-card-body" style="padding: 0;">
                <asp:GridView ID="gvLeaSummary" runat="server" AutoGenerateColumns="False" 
                    CssClass="custom-grid" GridLines="None" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="LEA_Name" HeaderText="LEA Name" ItemStyle-Font-Bold="True" />
                        <asp:BoundField DataField="Daily_Completed" HeaderText="Daily Completed" ItemStyle-ForeColor="#16a34a" ItemStyle-Font-Bold="True" ItemStyle-Width="150px" />
                        <asp:BoundField DataField="Periodic_Completed" HeaderText="Periodic Completed" ItemStyle-Width="150px" />
                        <asp:BoundField DataField="Total_Completed" HeaderText="Total Completed Tasks" ItemStyle-Font-Bold="True" ItemStyle-ForeColor="#0f2744" ItemStyle-Width="170px" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>
