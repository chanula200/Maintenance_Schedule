<%@ Page Title="New To Do" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Drawing" %>

<script runat="server" language="C#" type="text/c#">
    private Dictionary<DateTime, int> dailyDoneCounts = new Dictionary<DateTime, int>();
    protected int totalPendingDaily = 0;
    protected int totalCompletedDaily = 0;
    protected int totalMasterDaily = 90;

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadDailyStats();
        LoadDailyTaskDateCounts();

        if (!IsPostBack)
        {
            DateTime defaultDate = DateTime.Today;
            calDailyTasks.SelectedDate = defaultDate;
            calDailyTasks.VisibleDate = defaultDate;
            
            lblSelectedDate.Text = defaultDate.ToString("yyyy-MM-dd (dddd)") + " [Today]";
            LoadDailyTasks(defaultDate, false);
        }
    }

    private void LoadDailyStats()
    {
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = @"
                SELECT 
                    (SELECT COUNT(*) FROM dbo.FormData_V2 WHERE Frequency = 'Daily' AND ID <= 258) AS TotalMasterDaily,
                    ((SELECT COUNT(*) FROM dbo.FormData_V2 WHERE Frequency = 'Daily' AND ID <= 258) - 
                     (SELECT COUNT(DISTINCT c.Sc_ID)
                      FROM dbo.FormData_V2 c
                      WHERE c.Frequency = 'Daily' 
                        AND c.Status IN ('Closed', 'Completed', 'Close')
                        AND CAST(c.Completed_on AS date) = CAST(GETDATE() AS date)
                     )
                    ) AS PendingDaily,
                    (SELECT COUNT(*) 
                     FROM dbo.FormData_V2 c
                     WHERE c.Frequency = 'Daily' 
                       AND c.Status IN ('Closed', 'Completed', 'Close')
                    ) AS CompletedDaily";

            using (SqlCommand cmd = new SqlCommand(sql, conn))
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                if (r.Read())
                {
                    totalMasterDaily = Convert.ToInt32(r["TotalMasterDaily"]);
                    totalPendingDaily = Convert.ToInt32(r["PendingDaily"]);
                    totalCompletedDaily = Convert.ToInt32(r["CompletedDaily"]);
                }
            }
        }
    }

    private void LoadDailyTaskDateCounts()
    {
        dailyDoneCounts.Clear();
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = @"
                SELECT CAST(c.Completed_on AS date) AS DoneDate, COUNT(DISTINCT c.Sc_ID) AS DoneCnt
                FROM dbo.FormData_V2 c
                WHERE c.Frequency = 'Daily' 
                  AND c.Status IN ('Closed', 'Completed', 'Close')
                  AND c.Completed_on IS NOT NULL
                GROUP BY CAST(c.Completed_on AS date)";
            
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                while (r.Read())
                {
                    if (r["DoneDate"] != DBNull.Value)
                    {
                        DateTime d = Convert.ToDateTime(r["DoneDate"]).Date;
                        int c = Convert.ToInt32(r["DoneCnt"]);
                        dailyDoneCounts[d] = c;
                    }
                }
            }
        }
    }

    protected void calDailyTasks_SelectionChanged(object sender, EventArgs e)
    {
        DateTime selDate = calDailyTasks.SelectedDate.Date;
        if (selDate == DateTime.Today)
        {
            lblSelectedDate.Text = selDate.ToString("yyyy-MM-dd (dddd)") + " [Today - Active]";
            LoadDailyTasks(selDate, false);
        }
        else if (selDate > DateTime.Today)
        {
            lblSelectedDate.Text = selDate.ToString("yyyy-MM-dd (dddd)") + " [Future Date]";
            LoadDailyTasks(selDate, false);
        }
        else
        {
            lblSelectedDate.Text = selDate.ToString("yyyy-MM-dd (dddd)") + " [Past Date]";
            LoadDailyTasks(selDate, false);
        }
    }

    protected void calDailyTasks_DayRender(object sender, DayRenderEventArgs e)
    {
        DateTime dt = e.Day.Date;
        
        if (e.Day.IsToday)
        {
            // ONLY Today displays pending daily tasks
            int done = dailyDoneCounts.ContainsKey(dt) ? dailyDoneCounts[dt] : 0;
            int total = totalMasterDaily > 0 ? totalMasterDaily : 90;
            int pending = total - done;
            if (pending < 0) pending = 0;

            e.Cell.CssClass += " cal-today";
            e.Cell.BackColor = Color.FromArgb(235, 243, 255);

            if (done >= total)
            {
                e.Cell.BackColor = Color.FromArgb(240, 253, 244);
                e.Cell.Controls.Add(new LiteralControl("<div class='cal-task-pill cal-done-pill'>&#10003; Done</div>"));
            }
            else if (done > 0)
            {
                e.Cell.BackColor = Color.FromArgb(254, 249, 195);
                e.Cell.Controls.Add(new LiteralControl("<div class='cal-task-pill'>" + pending + " left</div>"));
            }
            else
            {
                e.Cell.Controls.Add(new LiteralControl("<div class='cal-task-pill'>" + total + " today</div>"));
            }
        }
        else if (dt < DateTime.Today)
        {
            // Past dates do not show pending daily tasks
            if (dailyDoneCounts.ContainsKey(dt) && dailyDoneCounts[dt] > 0)
            {
                e.Cell.Controls.Add(new LiteralControl("<div class='cal-task-pill cal-past-pill'>" + dailyDoneCounts[dt] + " closed</div>"));
            }
            e.Cell.ForeColor = Color.FromArgb(148, 163, 184);
        }
        else
        {
            // Future dates: do not show daily tasks
            e.Cell.ForeColor = Color.FromArgb(148, 163, 184);
        }
    }

    protected void btnShowToday_Click(object sender, EventArgs e)
    {
        DateTime today = DateTime.Today;
        calDailyTasks.SelectedDate = today;
        calDailyTasks.VisibleDate = today;
        lblSelectedDate.Text = today.ToString("yyyy-MM-dd (dddd)") + " [Today]";
        LoadDailyTasks(today, false);
    }

    protected void btnShowAllDaily_Click(object sender, EventArgs e)
    {
        lblSelectedDate.Text = "Master Daily Task Roster (All " + totalMasterDaily + " Routines)";
        LoadDailyTasks(null, true);
    }

    private void LoadDailyTasks(DateTime? dateFilter, bool showAll)
    {
        if (!showAll && dateFilter.HasValue && dateFilter.Value.Date != DateTime.Today)
        {
            // Daily operational tasks are strictly for Today
            gvDailyTasks.DataSource = null;
            gvDailyTasks.DataBind();
            lblDailyCount.Text = "0";
            pnlNoDailyTasks.Visible = true;
            if (dateFilter.Value.Date > DateTime.Today)
            {
                lblNoTasksMessage.Text = "<div style='font-size:13px;color:#475569;'><b>Future Date Selected (" + dateFilter.Value.ToString("yyyy-MM-dd") + ")</b><p style='margin:6px 0 0 0;font-size:12px;color:#64748b;'>Daily routine tasks only apply to <b>Today</b>. Future daily tasks become active on that day.</p></div>";
            }
            else
            {
                lblNoTasksMessage.Text = "<div style='font-size:13px;color:#475569;'><b>Past Date Selected (" + dateFilter.Value.ToString("yyyy-MM-dd") + ")</b><p style='margin:6px 0 0 0;font-size:12px;color:#64748b;'>Past daily routine tasks are closed. Please visit <a href='closedtask.aspx?type=daily' style='color:#0284c7;font-weight:bold;text-decoration:underline;'>Completed Tasks</a> to inspect historical records.</p></div>";
            }
            return;
        }

        lblNoTasksMessage.Text = "<div style='font-size:13px;color:#15803d;'><b>All daily tasks for today have been completed!</b><p style='margin:6px 0 0 0;font-size:12px;color:#64748b;'>Visit <a href='closedtask.aspx?type=daily' style='color:#0284c7;font-weight:bold;text-decoration:underline;'>Completed Tasks</a> to view submitted records.</p></div>";

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
                    'Pending' AS Status
                FROM dbo.FormData_V2 f
                LEFT JOIN dbo.Schedule_V2 s ON f.Sc_ID = s.ID
                LEFT JOIN dbo.Lea2 l ON s.LEA = l.LEA
                WHERE COALESCE(f.Frequency, s.Frequency) = 'Daily'
                  AND f.ID <= 258 AND f.Status = 'Pending'";

            if (!showAll && dateFilter.HasValue)
            {
                // Exclude tasks already completed on this specific target date
                sql += @" AND NOT EXISTS (
                    SELECT 1 FROM dbo.FormData_V2 c
                    WHERE c.Sc_ID = f.Sc_ID 
                      AND c.Status IN ('Closed', 'Completed', 'Close')
                      AND CAST(c.Completed_on AS date) = @TargetDate
                )";
            }

            sql += " ORDER BY COALESCE(s.Platform, f.Platform) ASC, f.Node_Name ASC, f.ID ASC";

            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                if (!showAll && dateFilter.HasValue)
                {
                    cmd.Parameters.AddWithValue("@TargetDate", dateFilter.Value.Date);
                }

                DataTable dt = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }

                gvDailyTasks.DataSource = dt;
                gvDailyTasks.DataBind();

                lblDailyCount.Text = dt.Rows.Count.ToString();
                pnlNoDailyTasks.Visible = (dt.Rows.Count == 0);
            }
        }
    }

    protected string GetFillFormUrl(object formId, object nodeName, object platform, object leaName)
    {
        DateTime targetDate = (calDailyTasks.SelectedDate != DateTime.MinValue) ? calDailyTasks.SelectedDate : DateTime.Today;
        return string.Format("NewMaintenanceForm.aspx?Form_ID={0}&Node_Name={1}&Platform={2}&LEA_Name={3}&Frequency=Daily&End_Date={4}",
            formId,
            Server.UrlEncode(nodeName != null ? nodeName.ToString() : ""),
            Server.UrlEncode(platform != null ? platform.ToString() : ""),
            Server.UrlEncode(leaName != null ? leaName.ToString() : ""),
            targetDate.ToString("yyyy-MM-dd")
        );
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

    protected string GetStatusBadgeClass(object statusObj)
    {
        if (statusObj == null) return "status-badge status-other";
        string status = statusObj.ToString().Trim().ToLowerInvariant();
        if (status == "pending") return "status-badge status-pending";
        if (status == "closed") return "status-badge status-closed";
        if (status == "open") return "status-badge status-open";
        return "status-badge status-other";
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Maintenance To Do (V2) - Periodic & Daily Schedule
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .v2-wrapper {
            padding: 15px 25px 40px 25px;
            font-family: "Segoe UI", -apple-system, BlinkMacSystemFont, Arial, sans-serif;
            background-color: #f7f9fc;
            min-height: 850px;
        }

        /* Top Header */
        .v2-header-box {
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
        .v2-title {
            color: #0f2744;
            font-size: 22px;
            font-weight: 700;
            margin: 0;
            display: inline-block;
        }
        .badge-pill {
            background-color: #2461BF;
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
        .badge-pill-daily {
            background-color: #0284c7;
        }
        .v2-subtitle {
            color: #64748b;
            font-size: 13px;
            margin-top: 4px;
        }

        /* Two-Column Dashboard Layout */
        .dashboard-split {
            display: flex;
            gap: 20px;
            align-items: flex-start;
        }
        @media (max-width: 1080px) {
            .dashboard-split {
                flex-direction: column;
            }
        }
        .col-left-periodic {
            flex: 1 1 54%;
            min-width: 0;
        }
        .col-right-daily {
            flex: 1 1 46%;
            min-width: 0;
        }

        /* Section Cards */
        .dashboard-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.06);
            overflow: hidden;
            margin-bottom: 20px;
        }
        .dashboard-card-header {
            background: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            padding: 12px 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }
        .dashboard-card-title {
            font-size: 15px;
            font-weight: 700;
            color: #1e293b;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .dashboard-card-body {
            padding: 15px;
        }

        /* Periodic Table Styling (Reduced Size & Compact) */
        .periodic-table-wrap {
            max-height: 680px;
            overflow-y: auto;
            border: 1px solid #edf2f7;
            border-radius: 6px;
        }
        .compact-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 12.5px;
        }
        .compact-grid th {
            background-color: #3b5998;
            color: #ffffff;
            font-weight: 600;
            padding: 7px 10px;
            text-align: center;
            font-size: 12px;
            position: sticky;
            top: 0;
            z-index: 2;
            border: none;
        }
        .compact-grid th.col-lea {
            text-align: left;
            padding-left: 12px;
        }
        .compact-grid td {
            padding: 6px 10px;
            border-bottom: 1px solid #e2e8f0;
            text-align: center;
            color: #334155;
        }
        .compact-grid tr:nth-child(even) {
            background-color: #f8fafc;
        }
        .compact-grid tr:hover {
            background-color: #e2e8f0;
        }
        .lea-name-link {
            font-weight: 600;
            color: #1d4ed8;
            text-decoration: none;
        }
        .lea-name-link:hover {
            text-decoration: underline;
            color: #0c4a6e;
        }
        .total-cell {
            font-weight: 700;
            color: #991b1b;
        }

        /* Buttons */
        .btn-action-primary {
            background-color: #2461BF;
            color: #ffffff;
            border: none;
            padding: 5px 12px;
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
        .btn-toolbar {
            background-color: #f1f5f9;
            color: #334155;
            border: 1px solid #cbd5e1;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 11.5px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.15s;
        }
        .btn-toolbar:hover {
            background-color: #e2e8f0;
            color: #0f172a;
            border-color: #94a3b8;
        }

        /* Calendar Styling */
        .calendar-container {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            padding: 6px 8px;
            margin: 0 auto 12px auto;
            max-width: 350px;
        }
        .cal-custom {
            width: 100% !important;
            border: none !important;
            font-family: inherit !important;
        }
        .cal-custom table {
            width: 100% !important;
        }
        .cal-custom .cal-title {
            background-color: #2461BF !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            height: 25px !important;
            border: none !important;
            font-size: 11.5px !important;
        }
        .cal-custom .cal-title a {
            color: #ffffff !important;
            text-decoration: none !important;
            font-weight: bold !important;
            padding: 1px 6px !important;
            font-size: 11px !important;
        }
        .cal-custom .cal-dayheader {
            background-color: #f1f5f9 !important;
            color: #475569 !important;
            font-weight: 600 !important;
            font-size: 10px !important;
            height: 18px !important;
            border-bottom: 1px solid #e2e8f0 !important;
        }
        .cal-custom td {
            height: 22px !important;
            font-size: 11px !important;
            text-align: center !important;
            border: 1px solid #f1f5f9 !important;
            vertical-align: middle !important;
            padding: 1px !important;
        }
        .cal-custom td a {
            color: #1e293b !important;
            font-weight: 500 !important;
            display: block !important;
            border-radius: 3px !important;
            padding: 1px 2px !important;
            line-height: 1.2 !important;
        }
        .cal-custom td a:hover {
            background-color: #dbeafe !important;
            color: #1e40af !important;
        }
        .cal-custom .cal-selected {
            background-color: #2461BF !important;
            color: #ffffff !important;
            border-radius: 3px !important;
        }
        .cal-custom .cal-selected a {
            color: #ffffff !important;
            font-weight: 700 !important;
        }
        .cal-task-pill {
            background-color: #0284c7;
            color: #ffffff;
            font-size: 8px;
            font-weight: 700;
            padding: 0px 3px;
            border-radius: 2px;
            display: inline-block;
            line-height: 1;
        }
        .cal-past-pill {
            background-color: #f1f5f9;
            color: #64748b;
            border: 1px solid #cbd5e1;
        }
        .cal-done-pill {
            background-color: #16a34a;
        }
        .cal-today {
            box-shadow: inset 0 0 0 1.5px #2461BF;
            border-radius: 3px;
        }

        /* Daily Tasks Sub-Section */
        .daily-task-header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            padding: 8px 12px;
            margin-bottom: 10px;
        }
        .date-active-pill {
            font-size: 12.5px;
            font-weight: 700;
            color: #0f172a;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .daily-tasks-scroll {
            max-height: 380px;
            overflow-y: auto;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
        }
        .daily-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
        }
        .daily-grid th {
            background-color: #475569;
            color: #ffffff;
            font-weight: 600;
            padding: 6px 8px;
            font-size: 11.5px;
            position: sticky;
            top: 0;
            z-index: 2;
        }
        .daily-grid td {
            padding: 6px 8px;
            border-bottom: 1px solid #edf2f7;
            color: #334155;
            vertical-align: middle;
        }
        .daily-grid tr:hover {
            background-color: #f8fafc;
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

        .status-badge {
            display: inline-block;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 10.5px;
            font-weight: 600;
        }
        .status-pending { background-color: #fef3c7; color: #b45309; }
        .status-closed { background-color: #dcfce7; color: #15803d; }
        .status-open { background-color: #e0f2fe; color: #0369a1; }
        .status-other { background-color: #f1f5f9; color: #64748b; }

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
        .no-data-box {
            text-align: center;
            padding: 25px 15px;
            color: #64748b;
            font-size: 13px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <div class="v2-wrapper">

        <!-- Top Header Bar -->
        <div class="v2-header-box">
            <div>
                <h2 class="v2-title">Maintenance Schedule To Do</h2>
                <span class="badge-pill">Periodic Tasks</span>
                <span class="badge-pill badge-pill-daily">Daily Tasks Divided</span>
                <div class="v2-subtitle">
                    Routine maintenance separated by Frequency: Periodic Schedules (Monthly, Quarterly, Annual) vs Daily Operational Checks.
                </div>
            </div>
            <div>
                <a href="NewTaskDetails.aspx?LEA_Name=All&FrequencyType=All" class="btn-action-primary">
                    View Master Task List &raquo;
                </a>
            </div>
        </div>



        <!-- Two-Column Dashboard -->
        <div class="dashboard-split">

            <!-- LEFT COLUMN: Periodic Maintenance by LEA & Platform (Reduced Size) -->
            <div class="col-left-periodic">
                <div class="dashboard-card">
                    <div class="dashboard-card-header">
                        <div class="dashboard-card-title">
                            <span>Task Summary by LEA & Platform</span>
                            <span style="font-size: 11px; font-weight: normal; color: #64748b; background: #e2e8f0; padding: 2px 7px; border-radius: 10px;">
                                Periodic Only (Excludes Daily)
                            </span>
                        </div>
                        <div>
                            <a href="NewTaskDetails.aspx?LEA_Name=All&FrequencyType=Periodic" class="btn-action-primary" style="font-size: 11.5px; padding: 4px 10px;">
                                View All Periodic &raquo;
                            </a>
                        </div>
                    </div>

                    <div class="dashboard-card-body" style="padding: 10px;">
                        <div class="periodic-table-wrap">
                            <asp:GridView ID="gvSummary" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                                CellPadding="5" DataSourceID="dsSummary" ForeColor="#333333" GridLines="None" 
                                HorizontalAlign="Center" CssClass="compact-grid" ShowFooter="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="LEA Name" SortExpression="LEA_Name" HeaderStyle-CssClass="col-lea" ItemStyle-HorizontalAlign="Left" ItemStyle-CssClass="col-lea">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlLEA" runat="server" CssClass="lea-name-link"
                                                NavigateUrl='<%# "NewTaskDetails.aspx?LEA_Name=" + Server.UrlEncode(Eval("LEA_Name").ToString()) + "&FrequencyType=Periodic" %>' 
                                                Text='<%# Eval("LEA_Name") %>' ToolTip="Click to view periodic task details for this LEA">
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <b>Total Periodic Tasks</b>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ITMC" HeaderText="ITMC" ReadOnly="True" SortExpression="ITMC" />
                                    <asp:BoundField DataField="SMW4" HeaderText="SMW4" ReadOnly="True" SortExpression="SMW4" />
                                    <asp:BoundField DataField="DSCN" HeaderText="DSCN" ReadOnly="True" SortExpression="DSCN" />
                                    <asp:BoundField DataField="BLCS" HeaderText="BLCS" ReadOnly="True" SortExpression="BLCS" />
                                    <asp:TemplateField HeaderText="Total Tasks" SortExpression="Total_Tasks">
                                        <ItemTemplate>
                                            <span class="total-cell"><%# Eval("Total_Tasks") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource ID="dsSummary" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" 
                                SelectCommand="GetToDOList_V2" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Periodic" Name="FrequencyType" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

            <!-- RIGHT COLUMN: Daily Routine Tasks & Calendar (Separated Daily Data) -->
            <div class="col-right-daily">
                <div class="dashboard-card">
                    <div class="dashboard-card-header">
                        <div class="dashboard-card-title">
                            <span>Daily Operational Tasks & Calendar</span>
                            <span style="font-size: 11px; font-weight: 600; color: #b45309; background: #fef3c7; padding: 2px 7px; border-radius: 10px;">
                                <%= totalPendingDaily %> Pending
                            </span>
                        </div>
                        <div style="display: flex; gap: 6px; align-items: center; flex-wrap: wrap;">
                            <a href="closedtask.aspx?type=daily" class="btn-action-primary" style="background-color: #16a34a; font-size: 11.5px; padding: 4px 10px;" title="View daily completed tasks in Completed Tasks section">
                                &#10003; Completed Daily (<%= totalCompletedDaily %>) &raquo;
                            </a>
                            <a href="NewTaskDetails.aspx?LEA_Name=All&FrequencyType=Daily" class="btn-action-primary" style="background-color: #0284c7; font-size: 11.5px; padding: 4px 10px;">
                                View All Daily (<%= totalPendingDaily %>) &raquo;
                            </a>
                        </div>
                    </div>

                    <div class="dashboard-card-body">
                        
                        <!-- Quick Jump Toolbar -->
                        <div style="margin-bottom: 10px; display: flex; gap: 6px; flex-wrap: wrap; align-items: center;">
                            <span style="font-size: 11px; font-weight: 600; color: #64748b;">Daily View:</span>
                            <asp:LinkButton ID="btnShowToday" runat="server" CssClass="btn-toolbar" OnClick="btnShowToday_Click" style="font-weight: 700; background: #e0f2fe; color: #0369a1; border-color: #bae6fd;">
                                &#128197; Today's Active Tasks (<%= DateTime.Today.ToString("MMM dd") %>)
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnShowAllDaily" runat="server" CssClass="btn-toolbar" OnClick="btnShowAllDaily_Click">
                                Master Daily Roster (<%= totalMasterDaily %> Routines)
                            </asp:LinkButton>
                        </div>

                        <!-- Interactive Calendar -->
                        <div class="calendar-container">
                            <asp:Calendar ID="calDailyTasks" runat="server" CssClass="cal-custom"
                                DayNameFormat="Shortest" FirstDayOfWeek="Monday" 
                                NextPrevFormat="CustomText" NextMonthText="&raquo;" PrevMonthText="&laquo;"
                                ShowGridLines="True"
                                OnSelectionChanged="calDailyTasks_SelectionChanged"
                                OnDayRender="calDailyTasks_DayRender">
                                <TitleStyle CssClass="cal-title" />
                                <DayHeaderStyle CssClass="cal-dayheader" />
                                <SelectedDayStyle CssClass="cal-selected" />
                            </asp:Calendar>
                        </div>

                        <!-- Daily Tasks List for Selected Date -->
                        <div class="daily-task-header-bar">
                            <div class="date-active-pill">
                                <span>Date:</span>
                                <asp:Label ID="lblSelectedDate" runat="server" Text="Select Date"></asp:Label>
                            </div>
                            <div>
                                <span style="font-size: 11px; color: #64748b;">Tasks Found: </span>
                                <span style="background: #2461BF; color: #ffffff; padding: 2px 7px; border-radius: 10px; font-size: 11px; font-weight: bold;">
                                    <asp:Label ID="lblDailyCount" runat="server" Text="0"></asp:Label>
                                </span>
                            </div>
                        </div>

                        <asp:Panel ID="pnlNoDailyTasks" runat="server" Visible="False">
                            <div class="no-data-box">
                                <asp:Label ID="lblNoTasksMessage" runat="server"></asp:Label>
                            </div>
                        </asp:Panel>

                        <div class="daily-tasks-scroll">
                            <asp:GridView ID="gvDailyTasks" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" GridLines="None" CssClass="daily-grid" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Platform" ItemStyle-Width="60px">
                                        <ItemTemplate>
                                            <span class='<%# GetPlatformBadgeClass(Eval("Platform")) %>'>
                                                <%# Eval("Platform") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Node & Task">
                                        <ItemTemplate>
                                            <div style="font-weight: 700; color: #0f172a; font-size: 12px; margin-bottom: 2px;">
                                                <%# Eval("Node_Name") %>
                                                <span style="font-size: 10px; font-weight: normal; color: #64748b;">(<%# Eval("LEA_Name") %>)</span>
                                            </div>
                                            <div style="color: #475569; font-size: 11.5px; line-height: 1.3;">
                                                <%# Eval("Maintenance_Task") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <span class='<%# GetStatusBadgeClass(Eval("Status")) %>'>
                                                <%# Eval("Status") %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <a class="btn-fill-task" href='<%# GetFillFormUrl(Eval("ID"), Eval("Node_Name"), Eval("Platform"), Eval("LEA_Name")) %>'>
                                                Fill Form &raquo;
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
