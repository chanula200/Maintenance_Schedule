<%@ Page Title="Routine Maintenance Record" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Collections.Generic" %>

<script runat="server" language="C#" type="text/c#">

    [Serializable]
    public class SubTaskItem
    {
        public int FormId { get; set; }
        public int SubIndex { get; set; }
        public string FullTaskName { get; set; }
        public string SubTaskName { get; set; }
        public string Frequency { get; set; }
        public bool IsValueTask { get; set; }
        public string ValuePlaceholder { get; set; }
        public string MeasuredValue { get; set; }
        public string Status { get; set; }
        public string Remark { get; set; }
    }

    private static bool CheckIsValueTask(string taskName, out string placeholder)
    {
        string lower = taskName.ToLowerInvariant();
        if (lower.Contains("current") && lower.Contains("voltage"))
        {
            placeholder = "Enter Current & Voltage (e.g. Current: 15A, Voltage: 230V)";
            return true;
        }
        if (lower.Contains("voltage") || lower.Contains("voltages") || lower.Contains("v-dc") || lower.Contains("conv voltage"))
        {
            placeholder = "Enter Voltage (e.g. 230V, 48V, -48V)";
            return true;
        }
        if (lower.Contains("current") || lower.Contains("i-sys") || lower.Contains("i-load") || lower.Contains("i-bat") || lower.Contains("earth current") || lower.Contains("feeding current"))
        {
            placeholder = "Enter Current (e.g. 15A, 5.2A)";
            return true;
        }
        if (lower.Contains("temperature") || lower.Contains("temp"))
        {
            placeholder = "Enter Temperature (e.g. 22 C)";
            return true;
        }
        if (lower.Contains("resistance") || lower.Contains("grounding resistance"))
        {
            placeholder = "Enter Resistance (e.g. 2.5 Ohm)";
            return true;
        }
        if (lower.Contains("wave length") || lower.Contains("wavelength") || lower.Contains("power level"))
        {
            placeholder = "Enter Measured Level (e.g. -3 dBm, 1550nm)";
            return true;
        }
        if (lower.Contains("reading") || lower.Contains("readings") || lower.Contains("parameters"))
        {
            placeholder = "Enter Recorded Reading / Value";
            return true;
        }
        placeholder = "";
        return false;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string nodeName = Request.QueryString["Node_Name"];
            string platform = Request.QueryString["Platform"];
            string lea = Request.QueryString["LEA_Name"];
            string freq = Request.QueryString["Frequency"];
            string endDate = Request.QueryString["End_Date"];

            if (string.IsNullOrEmpty(nodeName) && string.IsNullOrEmpty(Request.QueryString["Form_ID"]) && string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                lblError.Text = "Error: Node_Name or Form_ID parameter is missing.";
                lblError.Visible = true;
                pnlForm.Visible = false;
                return;
            }

            lblNodeName.Text = string.IsNullOrEmpty(nodeName) ? "" : Server.HtmlEncode(nodeName);
            lblLEA.Text = string.IsNullOrEmpty(lea) ? "N/A" : Server.HtmlEncode(lea);
            lblPlatformTitle.Text = string.IsNullOrEmpty(platform) ? "Routine Maintenance Record" : Server.HtmlEncode(platform) + " Routine Maintenance Record";

            string formIdStr = Request.QueryString["Form_ID"] ?? Request.QueryString["ID"];
            int formId = 0;
            int.TryParse(formIdStr, out formId);

            // Completed On is strictly today's date (cannot choose past or future days)
            txtCompletedDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
            calCompleted.SelectedDate = DateTime.Today;
            calCompleted.VisibleDate = DateTime.Today;

            string defaultBackUrl = "NewToDo.aspx";
            List<string> defaultParams = new List<string>();
            if (!string.IsNullOrEmpty(lea) && lea != "N/A")
            {
                defaultParams.Add("LEA_Name=" + Server.UrlEncode(lea));
            }
            if (!string.IsNullOrEmpty(platform))
            {
                defaultParams.Add("Platform=" + Server.UrlEncode(platform));
            }
            if (defaultParams.Count > 0)
            {
                defaultBackUrl += "?" + string.Join("&", defaultParams);
            }
            lnkBack.NavigateUrl = defaultBackUrl;

            LoadAndBindTasks(formId, nodeName, platform, lea, freq, endDate);
        }
    }

    private void LoadAndBindTasks(int targetFormId, string nodeName, string platform, string lea, string frequency, string endDate)
    {
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        List<SubTaskItem> subTaskList = new List<SubTaskItem>();
        HashSet<string> seenSubTasks = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();
            string sql;
            if (targetFormId > 0)
            {
                sql = @"
                    SELECT 
                        f.ID,
                        f.Sc_ID,
                        f.Node_Name,
                        COALESCE(f.Platform, s.Platform) AS Platform,
                        f.Maintenance_Task,
                        COALESCE(f.Frequency, s.Frequency) AS Frequency,
                        f.Status,
                        f.Remark,
                        f.Scheduled_Date,
                        f.End_Date,
                        f.Completed_on,
                        COALESCE(l.LEA_Name, s.LEA, 'N/A') AS LEA_Name
                    FROM dbo.FormData_V2 f
                    LEFT JOIN dbo.Schedule_V2 s ON f.Sc_ID = s.ID
                    LEFT JOIN dbo.Lea2 l ON s.LEA = l.LEA
                    WHERE f.ID = @Form_ID";
            }
            else if (!string.IsNullOrEmpty(frequency))
            {
                sql = @"
                    SELECT 
                        f.ID,
                        f.Sc_ID,
                        f.Node_Name,
                        COALESCE(f.Platform, s.Platform) AS Platform,
                        f.Maintenance_Task,
                        COALESCE(f.Frequency, s.Frequency) AS Frequency,
                        f.Status,
                        f.Remark,
                        f.Scheduled_Date,
                        f.End_Date,
                        f.Completed_on,
                        COALESCE(l.LEA_Name, s.LEA, 'N/A') AS LEA_Name
                    FROM dbo.FormData_V2 f
                    LEFT JOIN dbo.Schedule_V2 s ON f.Sc_ID = s.ID
                    LEFT JOIN dbo.Lea2 l ON s.LEA = l.LEA
                    WHERE f.Node_Name = @Node_Name
                      AND (COALESCE(f.Frequency, s.Frequency) = @Frequency)
                      AND (@Platform = '' OR COALESCE(f.Platform, s.Platform) = @Platform)
                      AND (@LEA_Name = '' OR COALESCE(l.LEA_Name, s.LEA) = @LEA_Name)
                    ORDER BY f.ID ASC";
            }
            else
            {
                // Fallback: select only the first/earliest active task for this node to avoid dumping all schedules together
                sql = @"
                    WITH RankedTasks AS (
                        SELECT 
                            f.ID,
                            f.Sc_ID,
                            f.Node_Name,
                            COALESCE(f.Platform, s.Platform) AS Platform,
                            f.Maintenance_Task,
                            COALESCE(f.Frequency, s.Frequency) AS Frequency,
                            f.Status,
                            f.Remark,
                            f.Scheduled_Date,
                            f.End_Date,
                            f.Completed_on,
                            COALESCE(l.LEA_Name, s.LEA, 'N/A') AS LEA_Name,
                            DENSE_RANK() OVER (ORDER BY f.Sc_ID ASC, f.ID ASC) as TaskRank
                        FROM dbo.FormData_V2 f
                        LEFT JOIN dbo.Schedule_V2 s ON f.Sc_ID = s.ID
                        LEFT JOIN dbo.Lea2 l ON s.LEA = l.LEA
                        WHERE f.Node_Name = @Node_Name
                          AND (@Platform = '' OR COALESCE(f.Platform, s.Platform) = @Platform)
                          AND (@LEA_Name = '' OR COALESCE(l.LEA_Name, s.LEA) = @LEA_Name)
                    )
                    SELECT * FROM RankedTasks WHERE TaskRank = 1";
            }

            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                if (targetFormId > 0)
                {
                    cmd.Parameters.AddWithValue("@Form_ID", targetFormId);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Node_Name", nodeName ?? "");
                    cmd.Parameters.AddWithValue("@Platform", platform ?? "");
                    cmd.Parameters.AddWithValue("@LEA_Name", lea ?? "");
                    if (!string.IsNullOrEmpty(frequency))
                    {
                        cmd.Parameters.AddWithValue("@Frequency", frequency);
                    }
                }

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Node_Name"] != DBNull.Value)
                        {
                            lblNodeName.Text = dt.Rows[0]["Node_Name"].ToString();
                        }
                        if (dt.Rows[0]["LEA_Name"] != DBNull.Value)
                        {
                            lblLEA.Text = dt.Rows[0]["LEA_Name"].ToString();
                        }
                        if (dt.Rows[0]["Platform"] != DBNull.Value)
                        {
                            lblPlatformTitle.Text = dt.Rows[0]["Platform"].ToString() + " Routine Maintenance Record";
                        }
                        if (dt.Rows[0]["Frequency"] != DBNull.Value)
                        {
                            lblFrequency.Text = dt.Rows[0]["Frequency"].ToString();
                        }
                        DateTime targetDate;
                        if (!string.IsNullOrEmpty(endDate) && DateTime.TryParse(endDate, out targetDate))
                        {
                            lblScheduledDate.Text = targetDate.ToString("yyyy-MM-dd");
                        }
                        else if (dt.Rows[0]["Scheduled_Date"] != DBNull.Value)
                        {
                            DateTime sd;
                            if (DateTime.TryParse(dt.Rows[0]["Scheduled_Date"].ToString(), out sd))
                            {
                                lblScheduledDate.Text = sd.ToString("yyyy-MM-dd");
                            }
                        }

                        string effectiveLea = (dt.Rows[0]["LEA_Name"] != DBNull.Value && dt.Rows[0]["LEA_Name"].ToString() != "N/A") ? dt.Rows[0]["LEA_Name"].ToString() : lea;
                        string effectivePlatform = (dt.Rows[0]["Platform"] != DBNull.Value) ? dt.Rows[0]["Platform"].ToString() : platform;

                        string backUrl = "NewTaskDetails.aspx";
                        List<string> qParams = new List<string>();
                        if (!string.IsNullOrEmpty(effectiveLea) && effectiveLea != "N/A")
                        {
                            qParams.Add("LEA_Name=" + Server.UrlEncode(effectiveLea));
                        }
                        if (!string.IsNullOrEmpty(effectivePlatform))
                        {
                            qParams.Add("Platform=" + Server.UrlEncode(effectivePlatform));
                        }
                        if (qParams.Count > 0)
                        {
                            backUrl += "?" + string.Join("&", qParams);
                        }
                        lnkBack.NavigateUrl = backUrl;

                        foreach (DataRow row in dt.Rows)
                        {
                            int formId = Convert.ToInt32(row["ID"]);
                            string rawTask = row["Maintenance_Task"] != DBNull.Value ? row["Maintenance_Task"].ToString().Trim() : "";
                            string freq = row["Frequency"] != DBNull.Value ? row["Frequency"].ToString().Trim() : "";
                            string rowStatus = row["Status"] != DBNull.Value ? row["Status"].ToString().Trim() : "Pending";
                            string rowRemark = row["Remark"] != DBNull.Value ? row["Remark"].ToString().Trim() : "";

                            if (rawTask.Contains("|"))
                            {
                                string[] parts = rawTask.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);
                                for (int i = 0; i < parts.Length; i++)
                                {
                                    string subName = parts[i].Trim();
                                    // Deduplicate identical subtasks
                                    if (seenSubTasks.Contains(subName))
                                    {
                                        continue;
                                    }
                                    seenSubTasks.Add(subName);

                                    string placeholder;
                                    bool isVal = CheckIsValueTask(subName, out placeholder);

                                    // Parse existing measurement and remark from compiled rowRemark if present
                                    string existingVal = "";
                                    string existingRemark = "";
                                    if (!string.IsNullOrEmpty(rowRemark))
                                    {
                                        string[] remParts = rowRemark.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);
                                        foreach (string rp in remParts)
                                        {
                                            string pTrim = rp.Trim();
                                            if (pTrim.StartsWith(subName, StringComparison.OrdinalIgnoreCase))
                                            {
                                                string afterName = pTrim.Substring(subName.Length).TrimStart(':', '-', ' ', '>');
                                                int obsIdx = afterName.IndexOf("(Obs:", StringComparison.OrdinalIgnoreCase);
                                                if (obsIdx >= 0)
                                                {
                                                    existingVal = afterName.Substring(0, obsIdx).Trim();
                                                    existingRemark = afterName.Substring(obsIdx + 5).Trim().TrimEnd(')');
                                                }
                                                else
                                                {
                                                    existingVal = afterName.Trim();
                                                }
                                                break;
                                            }
                                        }
                                    }

                                    subTaskList.Add(new SubTaskItem
                                    {
                                        FormId = formId,
                                        SubIndex = i,
                                        FullTaskName = rawTask,
                                        SubTaskName = subName,
                                        Frequency = freq,
                                        IsValueTask = isVal,
                                        ValuePlaceholder = placeholder,
                                        MeasuredValue = existingVal,
                                        Status = rowStatus,
                                        Remark = existingRemark
                                    });
                                }
                            }
                            else
                            {
                                string subName = rawTask;
                                // Deduplicate identical tasks
                                if (seenSubTasks.Contains(subName))
                                {
                                    continue;
                                }
                                seenSubTasks.Add(subName);

                                string placeholder;
                                bool isVal = CheckIsValueTask(subName, out placeholder);

                                string existingVal = "";
                                string existingRemark = "";
                                if (!string.IsNullOrEmpty(rowRemark))
                                {
                                    int obsIdx = rowRemark.IndexOf("(Obs:", StringComparison.OrdinalIgnoreCase);
                                    if (obsIdx >= 0)
                                    {
                                        existingVal = rowRemark.Substring(0, obsIdx).Trim();
                                        existingRemark = rowRemark.Substring(obsIdx + 5).Trim().TrimEnd(')');
                                    }
                                    else
                                    {
                                        existingVal = rowRemark.Trim();
                                    }
                                }

                                subTaskList.Add(new SubTaskItem
                                {
                                    FormId = formId,
                                    SubIndex = 0,
                                    FullTaskName = rawTask,
                                    SubTaskName = subName,
                                    Frequency = freq,
                                    IsValueTask = isVal,
                                    ValuePlaceholder = placeholder,
                                    MeasuredValue = existingVal,
                                    Status = rowStatus,
                                    Remark = existingRemark
                                });
                            }
                        }

                        rptTasks.DataSource = subTaskList;
                        rptTasks.DataBind();
                    }
                    else
                    {
                        lblError.Text = "No maintenance task records found in FormData_V2 for node '" + Server.HtmlEncode(nodeName) + "'.";
                        lblError.Visible = true;
                        pnlForm.Visible = false;
                    }
                }
            }
        }
    }

    protected void rptTasks_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            SubTaskItem item = (SubTaskItem)e.Item.DataItem;

            Panel pnlValue = (Panel)e.Item.FindControl("pnlValueInput");
            Panel pnlDropdown = (Panel)e.Item.FindControl("pnlDropdownInput");
            TextBox txtVal = (TextBox)e.Item.FindControl("txtMeasuredValue");
            DropDownList ddl = (DropDownList)e.Item.FindControl("ddlStatus");

            if (item.IsValueTask)
            {
                pnlValue.Visible = true;
                pnlDropdown.Visible = false;
                if (!string.IsNullOrEmpty(item.ValuePlaceholder))
                {
                    txtVal.Attributes["placeholder"] = item.ValuePlaceholder;
                }
                if (!string.IsNullOrEmpty(item.MeasuredValue))
                {
                    txtVal.Text = item.MeasuredValue;
                }
            }
            else
            {
                pnlValue.Visible = false;
                pnlDropdown.Visible = true;
                if (!string.IsNullOrEmpty(item.Status))
                {
                    string s = item.Status.Trim().ToLowerInvariant();
                    if (s == "yes" || s == "completed" || s == "cleaned" || s == "good" || s == "closed")
                    {
                        ddl.SelectedValue = "Yes";
                    }
                    else
                    {
                        ddl.SelectedValue = "No";
                    }
                }
                else
                {
                    ddl.SelectedValue = "No";
                }
            }

            TextBox txtRem = (TextBox)e.Item.FindControl("txtRemark");
            if (txtRem != null && !string.IsNullOrEmpty(item.Remark))
            {
                txtRem.Text = item.Remark;
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Enforce that completion date is strictly today's date (cannot choose past or future days)
        DateTime completedDate = DateTime.Today;
        txtCompletedDate.Text = DateTime.Today.ToString("yyyy-MM-dd");

        string nodeName = lblNodeName.Text.Trim();
        string updatedBy = Session["serviceno"] != null ? Session["serviceno"].ToString() : "Admin";
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;

        // Group submitted subtasks by FullTaskName / FormId
        Dictionary<string, List<string>> taskSummaryByFullTask = new Dictionary<string, List<string>>();
        Dictionary<string, string> finalStatusByFullTask = new Dictionary<string, string>();
        Dictionary<string, int> formIdByFullTask = new Dictionary<string, int>();

        foreach (RepeaterItem item in rptTasks.Items)
        {
            HiddenField hdnFormId = (HiddenField)item.FindControl("hdnFormId");
            HiddenField hdnFullTaskName = (HiddenField)item.FindControl("hdnFullTaskName");
            HiddenField hdnIsValue = (HiddenField)item.FindControl("hdnIsValue");
            Label lblSubTaskName = (Label)item.FindControl("lblSubTaskName");
            TextBox txtMeasuredValue = (TextBox)item.FindControl("txtMeasuredValue");
            DropDownList ddlStatus = (DropDownList)item.FindControl("ddlStatus");
            TextBox txtRemark = (TextBox)item.FindControl("txtRemark");

            if (hdnFormId != null && hdnFullTaskName != null)
            {
                int formId = Convert.ToInt32(hdnFormId.Value);
                string fullTask = hdnFullTaskName.Value;
                bool isVal = hdnIsValue.Value == "True";
                string subName = lblSubTaskName != null ? lblSubTaskName.Text : "Task";
                string remark = txtRemark != null ? txtRemark.Text.Trim() : "";

                string recordDetail = "";
                string itemStatus = "Completed";

                if (isVal && txtMeasuredValue != null)
                {
                    string val = txtMeasuredValue.Text.Trim();
                    recordDetail = subName + ": " + (string.IsNullOrEmpty(val) ? "Completed" : val);
                    if (!string.IsNullOrEmpty(remark))
                    {
                        recordDetail += " (Obs: " + remark + ")";
                    }
                    itemStatus = "Completed";
                }
                else if (ddlStatus != null)
                {
                    string sel = ddlStatus.SelectedValue;
                    itemStatus = (sel == "No") ? "Pending" : "Completed";
                    recordDetail = subName + " -> Status: " + sel;
                    if (!string.IsNullOrEmpty(remark))
                    {
                        recordDetail += " (Obs: " + remark + ")";
                    }
                }

                if (!taskSummaryByFullTask.ContainsKey(fullTask))
                {
                    taskSummaryByFullTask[fullTask] = new List<string>();
                    finalStatusByFullTask[fullTask] = itemStatus;
                    formIdByFullTask[fullTask] = formId;
                }
                else
                {
                    if (itemStatus == "Completed")
                    {
                        finalStatusByFullTask[fullTask] = "Completed";
                    }
                }

                taskSummaryByFullTask[fullTask].Add(recordDetail);
            }
        }

        int updatedCount = 0;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();

            foreach (var kvp in taskSummaryByFullTask)
            {
                string fullTask = kvp.Key;
                int formId = formIdByFullTask[fullTask];
                string compiledRemark = string.Join(" | ", kvp.Value);
                string status = finalStatusByFullTask[fullTask];

                // Fetch metadata for this task (Sc_ID, Platform, Frequency)
                int scId = formId;
                string platform = "";
                string taskFreq = "";
                using (SqlCommand cmdInfo = new SqlCommand("SELECT Sc_ID, Platform, Frequency FROM dbo.FormData_V2 WHERE ID = @ID", conn))
                {
                    cmdInfo.Parameters.AddWithValue("@ID", formId);
                    using (SqlDataReader rInfo = cmdInfo.ExecuteReader())
                    {
                        if (rInfo.Read())
                        {
                            scId = rInfo["Sc_ID"] != DBNull.Value ? Convert.ToInt32(rInfo["Sc_ID"]) : formId;
                            platform = rInfo["Platform"] != DBNull.Value ? rInfo["Platform"].ToString() : "";
                            taskFreq = rInfo["Frequency"] != DBNull.Value ? rInfo["Frequency"].ToString() : "";
                        }
                    }
                }

                bool isDaily = string.Equals(taskFreq, "Daily", StringComparison.OrdinalIgnoreCase) || 
                               string.Equals(lblFrequency.Text.Trim(), "Daily", StringComparison.OrdinalIgnoreCase);

                DateTime scheduledDate = completedDate.Date; // e.g. 09.09.2026 00:00
                DateTime endDateForDb = isDaily ? completedDate.Date.AddHours(23).AddMinutes(59) : completedDate.Date.AddHours(23).AddMinutes(59); // e.g. 09.09.2026 23:59

                // 1. DIRECTLY UPDATE the task record in dbo.FormData_V2
                string updateTaskSql = @"
                    UPDATE dbo.FormData_V2 
                    SET Status = @Status,
                        Remark = @Remark,
                        Completed_on = @Completed_on,
                        Scheduled_Date = @Scheduled_Date,
                        End_Date = @End_Date,
                        Updated_on = GETDATE(),
                        Updated_by = @Updated_by
                    WHERE ID = @ID OR (Node_Name = @Node_Name AND Maintenance_Task = @FullTaskName AND Frequency = @Frequency)";

                using (SqlCommand cmd = new SqlCommand(updateTaskSql, conn))
                {
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@Remark", compiledRemark);
                    cmd.Parameters.AddWithValue("@Completed_on", completedDate);
                    cmd.Parameters.AddWithValue("@Scheduled_Date", scheduledDate);
                    cmd.Parameters.AddWithValue("@End_Date", endDateForDb);
                    cmd.Parameters.AddWithValue("@Updated_by", updatedBy);
                    cmd.Parameters.AddWithValue("@ID", formId);
                    cmd.Parameters.AddWithValue("@Node_Name", nodeName);
                    cmd.Parameters.AddWithValue("@FullTaskName", fullTask);
                    cmd.Parameters.AddWithValue("@Frequency", isDaily ? "Daily" : taskFreq);
                    int rows = cmd.ExecuteNonQuery();
                    updatedCount += rows;
                }

                // 2. DIRECTLY UPDATE dbo.Schedule_V2 with observation remarks and matching Start_Date / End_Date
                string updateScheduleSql = @"
                    UPDATE dbo.Schedule_V2 
                    SET Remark = @Remark,
                        Start_Date = @Scheduled_Date,
                        End_Date = @End_Date
                    WHERE ID = @Sc_ID OR (Node_Name = @Node_Name AND Task = @FullTaskName)";

                using (SqlCommand cmdSch = new SqlCommand(updateScheduleSql, conn))
                {
                    cmdSch.Parameters.AddWithValue("@Remark", compiledRemark);
                    cmdSch.Parameters.AddWithValue("@Scheduled_Date", scheduledDate);
                    cmdSch.Parameters.AddWithValue("@End_Date", endDateForDb);
                    cmdSch.Parameters.AddWithValue("@Sc_ID", scId);
                    cmdSch.Parameters.AddWithValue("@Node_Name", nodeName);
                    cmdSch.Parameters.AddWithValue("@FullTaskName", fullTask);
                    cmdSch.ExecuteNonQuery();
                }

                // 3. For Daily tasks: Also maintain daily historical log record in dbo.FormData_V2
                if (isDaily)
                {
                    int existingCompletedId = 0;
                    string checkSql = @"
                        SELECT TOP 1 ID FROM dbo.FormData_V2 
                        WHERE Sc_ID = @Sc_ID 
                          AND ID <> @FormID
                          AND Status IN ('Closed', 'Completed', 'Close') 
                          AND CAST(Completed_on AS date) = @CompletedDate";

                    using (SqlCommand cmdCheck = new SqlCommand(checkSql, conn))
                    {
                        cmdCheck.Parameters.AddWithValue("@Sc_ID", scId);
                        cmdCheck.Parameters.AddWithValue("@FormID", formId);
                        cmdCheck.Parameters.AddWithValue("@CompletedDate", completedDate.Date);
                        object res = cmdCheck.ExecuteScalar();
                        if (res != null && res != DBNull.Value)
                        {
                            existingCompletedId = Convert.ToInt32(res);
                        }
                    }

                    if (existingCompletedId > 0)
                    {
                        string updateLogSql = @"
                            UPDATE dbo.FormData_V2 
                            SET Status = @Status,
                                Remark = @Remark,
                                Scheduled_Date = @Scheduled_Date,
                                End_Date = @End_Date,
                                Completed_on = @Completed_on,
                                Updated_on = GETDATE(),
                                Updated_by = @Updated_by
                            WHERE ID = @ID";

                        using (SqlCommand cmdLog = new SqlCommand(updateLogSql, conn))
                        {
                            cmdLog.Parameters.AddWithValue("@Status", status);
                            cmdLog.Parameters.AddWithValue("@Remark", compiledRemark);
                            cmdLog.Parameters.AddWithValue("@Scheduled_Date", scheduledDate);
                            cmdLog.Parameters.AddWithValue("@End_Date", endDateForDb);
                            cmdLog.Parameters.AddWithValue("@Completed_on", completedDate);
                            cmdLog.Parameters.AddWithValue("@Updated_by", updatedBy);
                            cmdLog.Parameters.AddWithValue("@ID", existingCompletedId);
                            cmdLog.ExecuteNonQuery();
                        }
                    }
                    else if (formId <= 258)
                    {
                        string insertLogSql = @"
                            INSERT INTO dbo.FormData_V2 
                            (Sc_ID, Node_Name, Platform, Maintenance_Task, Frequency, Status, Remark, Scheduled_Date, End_Date, Completed_on, Updated_on, Updated_by)
                            VALUES 
                            (@Sc_ID, @Node_Name, @Platform, @FullTaskName, 'Daily', @Status, @Remark, @Scheduled_Date, @End_Date, @Completed_on, GETDATE(), @Updated_by)";

                        using (SqlCommand cmdIns = new SqlCommand(insertLogSql, conn))
                        {
                            cmdIns.Parameters.AddWithValue("@Sc_ID", scId);
                            cmdIns.Parameters.AddWithValue("@Node_Name", nodeName);
                            cmdIns.Parameters.AddWithValue("@Platform", platform);
                            cmdIns.Parameters.AddWithValue("@FullTaskName", fullTask);
                            cmdIns.Parameters.AddWithValue("@Status", status);
                            cmdIns.Parameters.AddWithValue("@Remark", compiledRemark);
                            cmdIns.Parameters.AddWithValue("@Scheduled_Date", scheduledDate);
                            cmdIns.Parameters.AddWithValue("@End_Date", endDateForDb);
                            cmdIns.Parameters.AddWithValue("@Completed_on", completedDate);
                            cmdIns.Parameters.AddWithValue("@Updated_by", updatedBy);
                            cmdIns.ExecuteNonQuery();
                        }
                    }
                }
            }
        }

        lblMessage.Text = "Successfully saved and submitted " + updatedCount + " record(s) and their measurements! <a href='NewToDo.aspx' style='color:#059669;font-weight:bold;margin-left:12px;text-decoration:underline;'>&laquo; Return to Dashboard</a> | <a href='closedtask.aspx?type=daily' style='color:#0284c7;font-weight:bold;margin-left:8px;text-decoration:underline;'>View in Completed Tasks &raquo;</a>";
        lblMessage.ForeColor = System.Drawing.Color.Green;
        lblMessage.Visible = true;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        calCompleted.Visible = !calCompleted.Visible;
        if (calCompleted.Visible)
        {
            calCompleted.VisibleDate = DateTime.Today;
            calCompleted.SelectedDate = DateTime.Today;
        }
    }

    protected void calCompleted_DayRender(object sender, DayRenderEventArgs e)
    {
        // Enforce same day only: disable all past and future days
        if (e.Day.Date != DateTime.Today)
        {
            e.Day.IsSelectable = false;
            e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#94a3b8");
            e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#f8fafc");
            e.Cell.ToolTip = "Completion date can only be today (" + DateTime.Today.ToString("yyyy-MM-dd") + ")";
            e.Cell.Attributes.Add("style", "cursor: not-allowed; opacity: 0.45; pointer-events: none;");
        }
        else
        {
            e.Day.IsSelectable = true;
            e.Cell.Font.Bold = true;
            e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#dcfce7");
            e.Cell.ForeColor = System.Drawing.ColorTranslator.FromHtml("#166534");
            e.Cell.ToolTip = "Today: " + DateTime.Today.ToString("yyyy-MM-dd");
            e.Cell.Attributes.Add("style", "cursor: pointer; font-weight: bold; border: 2px solid #16a34a;");
        }
    }

    protected void calCompleted_SelectionChanged(object sender, EventArgs e)
    {
        // Strictly lock to today even if selection event fires
        txtCompletedDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
        if (calCompleted.SelectedDate.Date != DateTime.Today)
        {
            lblMessage.Text = "Notice: Completion date must be today (" + DateTime.Today.ToString("yyyy-MM-dd") + "). Future and past days cannot be selected.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true;
        }
        else
        {
            lblMessage.Visible = false;
        }
        calCompleted.Visible = false;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Routine Maintenance Record
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-container {
            padding: 15px 25px;
            font-family: "Segoe UI", Arial, Helvetica, sans-serif;
        }
        .form-title {
            color: #000066;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
            border-bottom: 2px solid #4b6c9e;
            padding-bottom: 8px;
        }
        .details-box {
            border: 1px solid #CCCCCC;
            background-color: #FFFFFF;
            width: 450px;
            margin-bottom: 15px;
            font-size: 13px;
        }
        .details-box td {
            padding: 6px 12px;
            border-bottom: 1px solid #eee;
        }
        .details-header-cell {
            background-color: #006699;
            color: #FFFFFF;
            font-weight: bold;
            width: 120px;
        }
        .section-heading {
            font-size: 15px;
            font-weight: bold;
            color: #000066;
            margin: 15px 0 10px 0;
        }
        .task-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #FFFFFF;
            border: 1px solid #dcdcdc;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        .task-table th {
            background-color: #507CD1;
            color: #FFFFFF;
            padding: 9px 12px;
            text-align: left;
            font-size: 13px;
        }
        .task-table td {
            padding: 9px 12px;
            border-bottom: 1px solid #e1e4e8;
            font-size: 13px;
            vertical-align: middle;
        }
        .task-table tr:nth-child(even) {
            background-color: #F8FAFC;
        }
        .task-table tr:hover {
            background-color: #EFF3FB;
        }
        .task-name-label {
            color: #000099;
            font-weight: 600;
            font-size: 13px;
            display: inline-block;
        }
        .task-frequency-tag {
            display: inline-block;
            font-size: 11px;
            color: #555;
            background: #eef2f7;
            border: 1px solid #ccd5e0;
            padding: 1px 7px;
            border-radius: 8px;
            margin-left: 6px;
        }
        .value-input-box {
            width: 250px;
            padding: 5px 8px;
            font-size: 13px;
            border: 1px solid #3b82f6;
            background-color: #f0f7ff;
            border-radius: 3px;
            color: #000;
        }
        .value-input-box:focus {
            background-color: #ffffff;
            border-color: #1d4ed8;
            outline: none;
        }
        .value-hint-tag {
            display: block;
            font-size: 11px;
            color: #2563eb;
            margin-top: 2px;
            font-style: italic;
        }
        .status-select {
            padding: 5px 8px;
            width: 200px;
            font-size: 13px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .remark-box {
            width: 95%;
            padding: 5px 8px;
            font-size: 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .btn-submit {
            background-color: #4b6c9e;
            color: #ffffff;
            font-size: 14px;
            font-weight: bold;
            padding: 8px 26px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 15px;
        }
        .btn-submit:hover {
            background-color: #2461BF;
        }
        .btn-back-link {
            display: inline-block;
            margin-left: 15px;
            color: #4b6c9e;
            font-size: 13px;
            text-decoration: underline;
        }
        .alert-msg {
            padding: 10px 15px;
            margin-bottom: 15px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <div class="form-container">
        <div class="form-title">
            <asp:Label ID="lblPlatformTitle" runat="server" Text="Routine Maintenance Record"></asp:Label>
        </div>

        <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Bold="True" Visible="False" CssClass="alert-msg"></asp:Label>
        <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="alert-msg"></asp:Label>

        <asp:Panel ID="pnlForm" runat="server">
            <table class="details-box">
                <tr>
                    <td class="details-header-cell">LEA</td>
                    <td><asp:Label ID="lblLEA" runat="server" Font-Bold="True" ForeColor="#000066"></asp:Label></td>
                </tr>
                <tr>
                    <td class="details-header-cell">Node_Name</td>
                    <td><asp:Label ID="lblNodeName" runat="server" Font-Bold="True" ForeColor="#000066"></asp:Label></td>
                </tr>
                <tr>
                    <td class="details-header-cell">Frequency</td>
                    <td><asp:Label ID="lblFrequency" runat="server" Font-Bold="True" ForeColor="#000066"></asp:Label></td>
                </tr>
                <tr>
                    <td class="details-header-cell">Scheduled Date</td>
                    <td><asp:Label ID="lblScheduledDate" runat="server" ForeColor="#333333"></asp:Label></td>
                </tr>
            </table>

            <div style="margin: 15px 0; display: flex; flex-wrap: wrap; align-items: center; gap: 8px;">
                <span style="font-weight: bold; color: #000066; font-size: 14px;">Completed On: </span>
                <asp:TextBox ID="txtCompletedDate" runat="server" Width="130px" ReadOnly="true" 
                    style="padding: 5px 10px; font-size: 13px; font-weight: 600; background-color: #f8fafc; border: 1px solid #cbd5e1; border-radius: 4px; color: #1e293b; cursor: not-allowed;" 
                    onkeydown="return false;"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="22px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="24px" style="vertical-align: middle; cursor: pointer;" ToolTip="Completion date must be today only" />
                <span style="display: inline-flex; align-items: center; background-color: #ecfdf5; color: #065f46; font-size: 11px; font-weight: 600; padding: 3px 8px; border-radius: 10px; border: 1px solid #a7f3d0;">
                    Today Only (Locked)
                </span>
                <div style="width: 100%;"></div>
                <asp:Calendar ID="calCompleted" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" 
                    CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" 
                    Height="180px" ShowNextPrevMonth="False" OnDayRender="calCompleted_DayRender" OnSelectionChanged="calCompleted_SelectionChanged" Visible="False" Width="220px" style="margin-top: 4px;">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#cbd5e1" />
                    <SelectedDayStyle BackColor="#16a34a" Font-Bold="True" ForeColor="#ffffff" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#dcfce7" ForeColor="#166534" Font-Bold="True" />
                    <WeekendDayStyle BackColor="#f8fafc" ForeColor="#94a3b8" />
                </asp:Calendar>
            </div>

            <div class="section-heading">Actions and Observations:</div>

            <table class="task-table">
                <thead>
                    <tr>
                        <th style="width: 42%;">Maintenance Task</th>
                        <th style="width: 28%;">Status / Measured Reading</th>
                        <th style="width: 30%;">Observation / Remarks</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptTasks" runat="server" OnItemDataBound="rptTasks_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hdnFormId" runat="server" Value='<%# Eval("FormId") %>' />
                                    <asp:HiddenField ID="hdnFullTaskName" runat="server" Value='<%# Eval("FullTaskName") %>' />
                                    <asp:HiddenField ID="hdnIsValue" runat="server" Value='<%# Eval("IsValueTask") %>' />
                                    <asp:Label ID="lblSubTaskName" runat="server" Text='<%# Eval("SubTaskName") %>' CssClass="task-name-label"></asp:Label>
                                    <span class="task-frequency-tag"><%# Eval("Frequency") %></span>
                                </td>
                                <td>
                                    <%-- VALUE / READING INPUT (For Voltage, Current, Temp, Resistance, etc.) --%>
                                    <asp:Panel ID="pnlValueInput" runat="server">
                                        <asp:TextBox ID="txtMeasuredValue" runat="server" CssClass="value-input-box"></asp:TextBox>
                                        <span class="value-hint-tag">&#9998; Enter recorded measurement</span>
                                    </asp:Panel>

                                    <%-- STATUS DROPDOWN (For Non-Measurement Tasks) --%>
                                    <asp:Panel ID="pnlDropdownInput" runat="server">
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="status-select">
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                            <asp:ListItem Value="No">No</asp:ListItem>
                                        </asp:DropDownList>
                                    </asp:Panel>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRemark" runat="server" Text='<%# Eval("Remark") %>' TextMode="MultiLine" Rows="2" CssClass="remark-box"></asp:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div style="margin-top: 20px;">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                <asp:HyperLink ID="lnkBack" runat="server" CssClass="btn-back-link">&laquo; Back to Task Details</asp:HyperLink>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
