<%@ Page Title="International Maintenance Summary" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Linq" %>

<script runat="server" language="C#" type="text/c#">

    // Standard 20 regional designations from classic summary.aspx
    private static readonly string[] StandardDesignations = new string[] {
        "NW/WPC-1", "NW/WPC-2", "NW/WPNE", "NW/WPSW", "NW/WPSE", "NW/WPE", "NW/WPN",
        "NW/NWPE", "NW/NWPW", "NW/CPN", "NW/CPS", "NW/NCP", "NW/UVA", "NW/SAB",
        "NW/SPE", "NW/SPW", "NW/WPS", "NW/EP", "NW/NP-1", "NW/NP-2"
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadYearDropdown();
            LoadResponsibilityDropdown();
            LoadSummaryData();
        }
    }

    private void LoadYearDropdown()
    {
        ddlYear.Items.Clear();
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "SELECT DISTINCT YEAR(Start_Date) AS Yr FROM dbo.Schedule_V3 WHERE Start_Date IS NOT NULL ORDER BY Yr DESC";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                while (r.Read())
                {
                    string yr = r["Yr"].ToString();
                    ddlYear.Items.Add(new ListItem(yr, yr));
                }
            }
        }
        if (ddlYear.Items.FindByValue("2026") != null)
        {
            ddlYear.SelectedValue = "2026";
        }
        else if (ddlYear.Items.Count > 0)
        {
            ddlYear.SelectedIndex = 0;
        }
        ddlYear.Items.Add(new ListItem("All Years", "ALL"));
    }

    private void LoadResponsibilityDropdown()
    {
        ddlResponsibility.Items.Clear();
        ddlResponsibility.Items.Add(new ListItem("All Profiles / Responsibilities", "ALL"));
        
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql = "SELECT DISTINCT Responsibility FROM dbo.Schedule_V3 WHERE Responsibility IS NOT NULL AND Responsibility <> '' ORDER BY Responsibility ASC";
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            using (SqlDataReader r = cmd.ExecuteReader())
            {
                while (r.Read())
                {
                    string resp = r["Responsibility"].ToString();
                    ddlResponsibility.Items.Add(new ListItem(resp, resp));
                }
            }
        }
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        LoadSummaryData();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        if (ddlYear.Items.FindByValue("2026") != null) ddlYear.SelectedValue = "2026";
        ddlResponsibility.SelectedValue = "ALL";
        ddlViewBy.SelectedValue = "Designation";
        ddlMetric.SelectedValue = "Scheduled";
        LoadSummaryData();
    }

    private void LoadSummaryData()
    {
        string selectedYear = ddlYear.SelectedValue;
        string selectedResp = ddlResponsibility.SelectedValue;
        string viewBy = ddlViewBy.SelectedValue; // "Designation", "ActiveDesignation", or "LEA"
        string metric = ddlMetric.SelectedValue; // "Scheduled" (default, all tasks), "Completed", "Both", "Percent"

        lblCurrentYearBadge.Text = selectedYear == "ALL" ? "All Years" : "Year " + selectedYear;
        lblFilterSummary.Text = "Filter: " + (selectedResp == "ALL" ? "All Profiles" : selectedResp) + 
                                " | Mode: " + ddlMetric.SelectedItem.Text;

        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;

        string sql = @"
            SELECT 
                s.Platform,
                MONTH(s.Start_Date) AS MonthNum,
                DATENAME(month, s.Start_Date) AS MonthName,
                COALESCE(NULLIF(NULLIF(l.designation, 'NULL'), ''), 'Other') AS Designation,
                COALESCE(NULLIF(NULLIF(l.LEA_Name, 'NULL'), ''), s.LEA, 'Other') AS LEA_Name,
                s.Responsibility,
                COUNT(*) AS SchedCount,
                SUM(CASE WHEN f.Status = 'Completed' THEN 1 ELSE 0 END) AS DoneCount
            FROM dbo.Schedule_V3 s
            LEFT JOIN dbo.Lea2 l ON s.LEA = l.LEA
            LEFT JOIN dbo.Formdata_V3 f ON s.ID = f.Sc_ID
            WHERE 1 = 1";

        if (selectedYear != "ALL")
        {
            sql += " AND YEAR(s.Start_Date) = @Year";
        }
        if (selectedResp != "ALL")
        {
            sql += " AND s.Responsibility = @Resp";
        }

        sql += @"
            GROUP BY 
                s.Platform, 
                MONTH(s.Start_Date), 
                DATENAME(month, s.Start_Date), 
                COALESCE(NULLIF(NULLIF(l.designation, 'NULL'), ''), 'Other'), 
                COALESCE(NULLIF(NULLIF(l.LEA_Name, 'NULL'), ''), s.LEA, 'Other'), 
                s.Responsibility";

        DataTable rawData = new DataTable();
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                if (selectedYear != "ALL")
                {
                    cmd.Parameters.AddWithValue("@Year", Convert.ToInt32(selectedYear));
                }
                if (selectedResp != "ALL")
                {
                    cmd.Parameters.AddWithValue("@Resp", selectedResp);
                }

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(rawData);
                }
            }
        }

        // Calculate KPI totals
        int totalScheduled = 0;
        int totalCompleted = 0;

        foreach (DataRow row in rawData.Rows)
        {
            totalScheduled += Convert.ToInt32(row["SchedCount"]);
            totalCompleted += Convert.ToInt32(row["DoneCount"]);
        }

        int totalPending = Math.Max(0, totalScheduled - totalCompleted);
        double complianceRate = totalScheduled > 0 ? ((double)totalCompleted / totalScheduled) * 100.0 : 0.0;

        lblKpiScheduled.Text = totalScheduled.ToString("N0");
        lblKpiCompleted.Text = totalCompleted.ToString("N0");
        lblKpiPending.Text = totalPending.ToString("N0");
        lblKpiCompliance.Text = complianceRate.ToString("0.0") + "%";
        pnlComplianceBar.Style["width"] = Math.Min(100, Math.Max(0, (int)complianceRate)) + "%";

        // Build Pivot Tables for each Platform
        BuildAndBindPlatformGrid("ITMC", rawData, gvITMC, pnlITMC, viewBy, metric);
        BuildAndBindPlatformGrid("DSCN", rawData, gvDSCN, pnlDSCN, viewBy, metric);
        BuildAndBindPlatformGrid("BLCS", rawData, gvBLCS, pnlBLCS, viewBy, metric);
        BuildAndBindPlatformGrid("SMW4", rawData, gvSMW4, pnlSMW4, viewBy, metric);
        BuildAndBindPlatformGrid("ALL", rawData, gvCombined, pnlCombined, viewBy, metric);
    }

    private void BuildAndBindPlatformGrid(string targetPlatform, DataTable rawData, GridView gv, Panel pnlContainer, string viewBy, string metric)
    {
        DataRow[] platformRows;
        if (targetPlatform == "ALL")
        {
            platformRows = rawData.Select();
        }
        else
        {
            platformRows = rawData.Select("Platform = '" + targetPlatform + "'");
        }

        if (platformRows.Length == 0 && targetPlatform != "ALL")
        {
            pnlContainer.Visible = false;
            return;
        }
        pnlContainer.Visible = true;

        string colFieldName = (viewBy == "LEA") ? "LEA_Name" : "Designation";

        // Determine columns to display
        List<string> dynamicCols = new List<string>();

        if (viewBy == "Designation")
        {
            // Standard 20 designations format matching classic summary.aspx
            foreach (string std in StandardDesignations)
            {
                dynamicCols.Add(std);
            }
            // Add any extra designations present in data
            foreach (DataRow r in platformRows)
            {
                string colVal = r["Designation"] != DBNull.Value ? r["Designation"].ToString().Trim() : "";
                if (!string.IsNullOrEmpty(colVal) && !dynamicCols.Contains(colVal) && colVal != "Other")
                {
                    dynamicCols.Add(colVal);
                }
            }
            // Add Other column for unassigned
            bool hasOther = platformRows.Any(r => (r["Designation"] == DBNull.Value || r["Designation"].ToString().Trim() == "Other" || string.IsNullOrEmpty(r["Designation"].ToString().Trim())));
            if (hasOther && !dynamicCols.Contains("Other"))
            {
                dynamicCols.Add("Other");
            }
        }
        else if (viewBy == "ActiveDesignation")
        {
            // Only designations that have data for this platform
            foreach (DataRow r in platformRows)
            {
                string colVal = r["Designation"] != DBNull.Value ? r["Designation"].ToString().Trim() : "Other";
                if (string.IsNullOrEmpty(colVal)) colVal = "Other";
                if (!dynamicCols.Contains(colVal))
                {
                    dynamicCols.Add(colVal);
                }
            }
            dynamicCols.Sort();
            if (dynamicCols.Contains("Other"))
            {
                dynamicCols.Remove("Other");
                dynamicCols.Add("Other");
            }
        }
        else
        {
            // By LEA Name
            foreach (DataRow r in platformRows)
            {
                string colVal = r["LEA_Name"] != DBNull.Value ? r["LEA_Name"].ToString().Trim() : "Other";
                if (string.IsNullOrEmpty(colVal)) colVal = "Other";
                if (!dynamicCols.Contains(colVal))
                {
                    dynamicCols.Add(colVal);
                }
            }
            dynamicCols.Sort();
            if (dynamicCols.Contains("Other"))
            {
                dynamicCols.Remove("Other");
                dynamicCols.Add("Other");
            }
        }

        // Build pivoted DataTable
        DataTable pivotTable = new DataTable();
        pivotTable.Columns.Add("Month", typeof(string));
        foreach (string col in dynamicCols)
        {
            pivotTable.Columns.Add(col, typeof(string));
        }
        pivotTable.Columns.Add("Total", typeof(string));

        string[] monthNames = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };

        Dictionary<string, int> colTotalSched = new Dictionary<string, int>();
        Dictionary<string, int> colTotalDone = new Dictionary<string, int>();
        foreach (string col in dynamicCols)
        {
            colTotalSched[col] = 0;
            colTotalDone[col] = 0;
        }
        int grandTotalSched = 0;
        int grandTotalDone = 0;

        for (int m = 1; m <= 12; m++)
        {
            string monthName = monthNames[m - 1];
            DataRow newRow = pivotTable.NewRow();
            newRow["Month"] = monthName;

            int rowSched = 0;
            int rowDone = 0;

            foreach (string col in dynamicCols)
            {
                int cellSched = 0;
                int cellDone = 0;

                foreach (DataRow r in platformRows)
                {
                    int rowMonth = Convert.ToInt32(r["MonthNum"]);
                    string rowCol = r[colFieldName] != DBNull.Value ? r[colFieldName].ToString().Trim() : "Other";
                    if (string.IsNullOrEmpty(rowCol)) rowCol = "Other";

                    if (rowMonth == m && string.Equals(rowCol, col, StringComparison.OrdinalIgnoreCase))
                    {
                        cellSched += Convert.ToInt32(r["SchedCount"]);
                        cellDone += Convert.ToInt32(r["DoneCount"]);
                    }
                }

                rowSched += cellSched;
                rowDone += cellDone;
                colTotalSched[col] += cellSched;
                colTotalDone[col] += cellDone;

                newRow[col] = FormatMetricCell(cellSched, cellDone, metric);
            }

            grandTotalSched += rowSched;
            grandTotalDone += rowDone;
            newRow["Total"] = FormatMetricCell(rowSched, rowDone, metric);
            pivotTable.Rows.Add(newRow);
        }

        // Add Summary/Total Row at the bottom
        DataRow totalRow = pivotTable.NewRow();
        totalRow["Month"] = "Total";
        foreach (string col in dynamicCols)
        {
            totalRow[col] = FormatMetricCell(colTotalSched[col], colTotalDone[col], metric);
        }
        totalRow["Total"] = FormatMetricCell(grandTotalSched, grandTotalDone, metric);
        pivotTable.Rows.Add(totalRow);

        gv.DataSource = pivotTable;
        gv.DataBind();
    }

    private string FormatMetricCell(int sched, int done, string metric)
    {
        if (metric == "Scheduled")
        {
            // All tasks in the schedule (Default, matches classic summary.aspx)
            return sched > 0 ? sched.ToString("N0") : "-";
        }
        else if (metric == "Completed")
        {
            return done > 0 ? done.ToString("N0") : "-";
        }
        else if (metric == "Both")
        {
            return sched > 0 ? (done + " / " + sched) : "-";
        }
        else if (metric == "Percent")
        {
            if (sched == 0) return "-";
            double pct = ((double)done / sched) * 100.0;
            return pct.ToString("0.0") + "%";
        }
        return sched.ToString();
    }

    protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string monthCell = e.Row.Cells[0].Text;
            if (monthCell.StartsWith("Total", StringComparison.OrdinalIgnoreCase))
            {
                e.Row.CssClass = "summary-total-row";
                e.Row.Font.Bold = true;
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#eff6ff");
                e.Row.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1e3a8a");
            }
            else
            {
                int lastIdx = e.Row.Cells.Count - 1;
                string totalVal = e.Row.Cells[lastIdx].Text.Trim();
                if (totalVal != "-" && totalVal != "0" && !totalVal.StartsWith("0.0"))
                {
                    e.Row.Cells[lastIdx].Font.Bold = true;
                    e.Row.Cells[lastIdx].BackColor = System.Drawing.ColorTranslator.FromHtml("#f1f5f9");
                }
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    International Maintenance Summary
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .summary-wrapper {
            max-width: 1350px;
            margin: 0 auto 40px auto;
            padding: 10px 15px;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, Helvetica, Arial, sans-serif;
            color: #1e293b;
        }

        .page-header-card {
            background: linear-gradient(135deg, #0f172a 0%, #1e3a8a 100%);
            border-radius: 12px;
            padding: 22px 26px;
            color: #ffffff;
            margin-bottom: 22px;
            box-shadow: 0 4px 15px rgba(15, 23, 42, 0.15);
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
        }

        .header-title-area h2 {
            margin: 0 0 4px 0;
            font-size: 23px;
            font-weight: 700;
            letter-spacing: -0.5px;
            color: #ffffff;
        }

        .header-title-area p {
            margin: 0;
            font-size: 13px;
            color: #93c5fd;
        }

        .header-badge {
            display: inline-block;
            background: rgba(255, 255, 255, 0.18);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 20px;
            padding: 6px 14px;
            font-size: 13px;
            font-weight: 600;
            color: #ffffff;
        }

        /* KPI Card Container */
        .kpi-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 16px;
            margin-bottom: 22px;
        }

        .kpi-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 16px 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
            border: 1px solid #e2e8f0;
            border-left: 5px solid #3b82f6;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .kpi-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
        }

        .kpi-card.green { border-left-color: #10b981; }
        .kpi-card.amber { border-left-color: #f59e0b; }
        .kpi-card.purple { border-left-color: #8b5cf6; }

        .kpi-label {
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #64748b;
            margin-bottom: 4px;
        }

        .kpi-value {
            font-size: 26px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 6px;
        }

        .compliance-bar-bg {
            width: 100%;
            height: 6px;
            background: #e2e8f0;
            border-radius: 3px;
            overflow: hidden;
            margin-top: 6px;
        }

        .compliance-bar-fill {
            height: 100%;
            background: linear-gradient(90deg, #10b981, #059669);
            border-radius: 3px;
            width: 0%;
            transition: width 0.5s ease-in-out;
        }

        /* Filter Box */
        .filter-panel {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 16px 20px;
            margin-bottom: 26px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .filter-row {
            display: flex;
            flex-wrap: wrap;
            align-items: flex-end;
            gap: 14px;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
            min-width: 175px;
        }

        .filter-label {
            font-size: 11.5px;
            font-weight: 700;
            color: #334155;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }

        .filter-select {
            padding: 7px 11px;
            font-size: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            background-color: #f8fafc;
            color: #0f172a;
            font-weight: 500;
            outline: none;
            transition: border-color 0.15s ease;
        }

        .filter-select:focus {
            border-color: #2563eb;
            background-color: #ffffff;
            box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.15);
        }

        .btn-filter-action {
            padding: 8px 18px;
            font-size: 13px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            transition: all 0.15s ease;
            height: 36px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-apply {
            background-color: #1e40af;
            color: #ffffff;
        }

        .btn-apply:hover {
            background-color: #1d4ed8;
            box-shadow: 0 2px 8px rgba(30, 64, 175, 0.3);
        }

        .btn-reset {
            background-color: #f1f5f9;
            color: #475569;
            border: 1px solid #cbd5e1;
        }

        .btn-reset:hover {
            background-color: #e2e8f0;
            color: #0f172a;
        }

        /* Section Container */
        .section-card {
            background: #ffffff;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.06);
            margin-bottom: 28px;
            overflow: hidden;
        }

        .section-header {
            background: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
            padding: 12px 18px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .section-title {
            font-size: 16px;
            font-weight: 700;
            color: #002244;
            display: flex;
            align-items: center;
            gap: 8px;
            margin: 0;
        }

        .section-tag {
            background: #dbeafe;
            color: #1e40af;
            font-size: 11px;
            font-weight: 700;
            padding: 3px 10px;
            border-radius: 12px;
            text-transform: uppercase;
        }

        .table-responsive {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        /* GridView Styling */
        .summary-grid {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
            text-align: center;
        }

        .summary-grid th {
            background-color: #1e3a8a;
            color: #ffffff;
            font-weight: 600;
            padding: 9px 8px;
            border: 1px solid #1e40af;
            white-space: nowrap;
            letter-spacing: 0.2px;
            font-size: 11px;
        }

        .summary-grid th:first-child {
            text-align: left;
            padding-left: 14px;
            min-width: 110px;
            font-size: 12px;
        }

        .summary-grid th:last-child {
            background-color: #0f172a;
            border-color: #1e293b;
            min-width: 75px;
            font-size: 12px;
        }

        .summary-grid td {
            padding: 7px 8px;
            border: 1px solid #e2e8f0;
            color: #334155;
            white-space: nowrap;
        }

        .summary-grid td:first-child {
            text-align: left;
            font-weight: 600;
            color: #0f172a;
            padding-left: 14px;
            background-color: #f8fafc;
        }

        .summary-grid td:last-child {
            font-weight: 700;
            color: #0f172a;
            background-color: #f8fafc;
        }

        .summary-grid tr:nth-child(even) td {
            background-color: #fcfdfd;
        }

        .summary-grid tr:hover td {
            background-color: #f1f5f9;
        }

        .summary-total-row td {
            background-color: #eff6ff !important;
            color: #1e3a8a !important;
            font-weight: 700 !important;
            border-top: 2px solid #93c5fd !important;
            border-bottom: 2px solid #93c5fd !important;
        }

        .summary-total-row td:first-child {
            color: #1e3a8a !important;
        }

        /* Action Toolbar */
        .toolbar-area {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            margin-top: 20px;
            gap: 12px;
        }

        .btn-nav-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 16px;
            background-color: #ffffff;
            color: #1e3a8a;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.15s ease;
        }

        .btn-nav-link:hover {
            background-color: #f8fafc;
            border-color: #94a3b8;
            color: #0f172a;
        }

        @media print {
            .page-header-card, .filter-panel, .toolbar-area, .kpi-grid {
                box-shadow: none !important;
            }
            .filter-panel, .toolbar-area {
                display: none !important;
            }
            .section-card {
                page-break-inside: avoid;
                border: 1px solid #000;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <div class="summary-wrapper">
        
        <!-- Header Banner -->
        <div class="page-header-card">
            <div class="header-title-area">
                <h2>&#128202; International Maintenance Summary</h2>
                <p>Task distribution matrix across regional designations and platforms (Schedule V3)</p>
            </div>
            <div>
                <asp:Label ID="lblCurrentYearBadge" runat="server" CssClass="header-badge" Text="Year 2026"></asp:Label>
            </div>
        </div>

        <!-- KPI Cards -->
        <div class="kpi-grid">
            <div class="kpi-card">
                <div class="kpi-label">Total Scheduled Tasks</div>
                <div class="kpi-value"><asp:Label ID="lblKpiScheduled" runat="server" Text="0"></asp:Label></div>
                <div style="font-size: 11px; color: #64748b;">Annual scheduled workload in V3</div>
            </div>

            <div class="kpi-card green">
                <div class="kpi-label">Completed Tasks</div>
                <div class="kpi-value" style="color: #059669;"><asp:Label ID="lblKpiCompleted" runat="server" Text="0"></asp:Label></div>
                <div style="font-size: 11px; color: #059669; font-weight: 600;">&#10003; Successfully closed &amp; recorded</div>
            </div>

            <div class="kpi-card amber">
                <div class="kpi-label">Pending / Incomplete</div>
                <div class="kpi-value" style="color: #d97706;"><asp:Label ID="lblKpiPending" runat="server" Text="0"></asp:Label></div>
                <div style="font-size: 11px; color: #64748b;">Tasks awaiting execution</div>
            </div>

            <div class="kpi-card purple">
                <div class="kpi-label">Overall Compliance Rate</div>
                <div class="kpi-value" style="color: #6366f1;"><asp:Label ID="lblKpiCompliance" runat="server" Text="0.0%"></asp:Label></div>
                <div class="compliance-bar-bg">
                    <asp:Panel ID="pnlComplianceBar" runat="server" CssClass="compliance-bar-fill"></asp:Panel>
                </div>
            </div>
        </div>

        <!-- Filter Controls -->
        <div class="filter-panel">
            <div style="font-size: 13px; font-weight: 700; color: #0f172a; margin-bottom: 12px; display: flex; align-items: center; justify-content: space-between;">
                <span>&#128269; Customize Summary View</span>
                <asp:Label ID="lblFilterSummary" runat="server" Font-Size="11px" ForeColor="#64748b" Font-Bold="False"></asp:Label>
            </div>
            <div class="filter-row">
                <div class="filter-group">
                    <label class="filter-label">Select Year:</label>
                    <asp:DropDownList ID="ddlYear" runat="server" CssClass="filter-select"></asp:DropDownList>
                </div>

                <div class="filter-group">
                    <label class="filter-label">Responsibility / Profile:</label>
                    <asp:DropDownList ID="ddlResponsibility" runat="server" CssClass="filter-select"></asp:DropDownList>
                </div>

                <div class="filter-group">
                    <label class="filter-label">Columns Format:</label>
                    <asp:DropDownList ID="ddlViewBy" runat="server" CssClass="filter-select">
                        <asp:ListItem Value="Designation" Selected="True">Standard 20 Designations (NW/...)</asp:ListItem>
                        <asp:ListItem Value="ActiveDesignation">Active Designations Only</asp:ListItem>
                        <asp:ListItem Value="LEA">Station / LEA Name</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="filter-group">
                    <label class="filter-label">Display Metric:</label>
                    <asp:DropDownList ID="ddlMetric" runat="server" CssClass="filter-select">
                        <asp:ListItem Value="Scheduled" Selected="True">All Scheduled Tasks (Count)</asp:ListItem>
                        <asp:ListItem Value="Completed">Completed Tasks (Count)</asp:ListItem>
                        <asp:ListItem Value="Both">Done / Scheduled</asp:ListItem>
                        <asp:ListItem Value="Percent">Compliance Rate (%)</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div style="display: flex; gap: 8px;">
                    <asp:Button ID="btnFilter" runat="server" Text="Apply" CssClass="btn-filter-action btn-apply" OnClick="btnFilter_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn-filter-action btn-reset" OnClick="btnReset_Click" />
                </div>
            </div>
        </div>

        <!-- 1. SUMMARY OF ITMC PLATFORM -->
        <asp:Panel ID="pnlITMC" runat="server" CssClass="section-card">
            <div class="section-header">
                <h3 class="section-title">&#128421; Summary of ITMC</h3>
                <span class="section-tag">Platform: ITMC</span>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="gvITMC" runat="server" AutoGenerateColumns="True" CssClass="summary-grid" GridLines="Both" OnRowDataBound="gv_RowDataBound">
                </asp:GridView>
            </div>
        </asp:Panel>

        <!-- 2. SUMMARY OF DSCN PLATFORM -->
        <asp:Panel ID="pnlDSCN" runat="server" CssClass="section-card">
            <div class="section-header">
                <h3 class="section-title">&#127760; Summary of DSCN</h3>
                <span class="section-tag">Platform: DSCN</span>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="gvDSCN" runat="server" AutoGenerateColumns="True" CssClass="summary-grid" GridLines="Both" OnRowDataBound="gv_RowDataBound">
                </asp:GridView>
            </div>
        </asp:Panel>

        <!-- 3. SUMMARY OF BLCS PLATFORM -->
        <asp:Panel ID="pnlBLCS" runat="server" CssClass="section-card">
            <div class="section-header">
                <h3 class="section-title">&#9889; Summary of BLCS</h3>
                <span class="section-tag">Platform: BLCS</span>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="gvBLCS" runat="server" AutoGenerateColumns="True" CssClass="summary-grid" GridLines="Both" OnRowDataBound="gv_RowDataBound">
                </asp:GridView>
            </div>
        </asp:Panel>

        <!-- 4. SUMMARY OF SMW4 PLATFORM -->
        <asp:Panel ID="pnlSMW4" runat="server" CssClass="section-card">
            <div class="section-header">
                <h3 class="section-title">&#127754; Summary of SMW4</h3>
                <span class="section-tag">Platform: SMW4</span>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="gvSMW4" runat="server" AutoGenerateColumns="True" CssClass="summary-grid" GridLines="Both" OnRowDataBound="gv_RowDataBound">
                </asp:GridView>
            </div>
        </asp:Panel>

        <!-- 5. COMBINED TOTAL SUMMARY -->
        <asp:Panel ID="pnlCombined" runat="server" CssClass="section-card">
            <div class="section-header" style="background-color: #0f172a; color: #ffffff;">
                <h3 class="section-title" style="color: #ffffff;">&#128200; All Platforms - International Total Summary</h3>
                <span class="section-tag" style="background-color: #1e3a8a; color: #93c5fd;">Combined Total</span>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="gvCombined" runat="server" AutoGenerateColumns="True" CssClass="summary-grid" GridLines="Both" OnRowDataBound="gv_RowDataBound">
                </asp:GridView>
            </div>
        </asp:Panel>

        <!-- Bottom Quick Navigation Toolbar -->
        <div class="toolbar-area">
            <div style="display: flex; gap: 10px;">
                <a href="NewToDo.aspx" class="btn-nav-link">&#128203; Back to To Do Dashboard</a>
                <a href="closedtask.aspx?type=daily" class="btn-nav-link">&#10003; View Completed Tasks</a>
            </div>
            <div>
                <button type="button" onclick="window.print();" class="btn-nav-link">&#128438; Print / Save Report</button>
            </div>
        </div>

    </div>
</asp:Content>
