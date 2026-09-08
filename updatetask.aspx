<%@ Page Title="Completed Task Details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string lea = Request.QueryString["LEA_Name"];
            if (!string.IsNullOrEmpty(lea) && lea != "All")
            {
                lblPageHeader.Text = "Completed Task Details: " + Server.HtmlEncode(lea);
                lblLeaBreadcrumb.Text = Server.HtmlEncode(lea);
            }
            else
            {
                lblPageHeader.Text = "All Completed Tasks (All LEAs)";
                lblLeaBreadcrumb.Text = "All LEAs";
            }
        }
    }

    protected void ddlPlatformFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvCompletedTasks.PageIndex = 0;
        gvCompletedTasks.DataBind();
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
    Completed Task Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .subtask-list {
            display: flex;
            flex-direction: column;
            gap: 4px;
            padding: 3px 0;
            text-align: left;
        }
        .subtask-item {
            line-height: 1.35;
            font-size: 13px;
        }
        .subtask-bullet {
            color: #2461BF;
            font-weight: bold;
            margin-right: 4px;
        }
        .task-container {
            padding: 15px 25px;
            font-family: "Segoe UI", Arial, Helvetica, sans-serif;
        }
        .task-header {
            border-bottom: 2px solid #4b6c9e;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
        .task-title {
            color: #000066;
            font-size: 22px;
            font-weight: bold;
            display: inline-block;
            margin: 0;
        }
        .task-badge {
            background-color: #5cb85c;
            color: #ffffff;
            font-size: 12px;
            padding: 4px 10px;
            border-radius: 12px;
            margin-left: 10px;
            vertical-align: middle;
        }
        .task-card {
            background-color: #ffffff;
            border: 1px solid #dcdcdc;
            border-radius: 4px;
            padding: 15px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .filter-bar {
            background-color: #f5f7fa;
            border: 1px solid #e1e4e8;
            padding: 10px 15px;
            margin-bottom: 15px;
            border-radius: 4px;
        }
        .grid-header {
            background-color: #507CD1;
            color: White;
            font-weight: bold;
            height: 35px;
            text-align: center;
        }
        .grid-row {
            background-color: #EFF3FB;
            text-align: center;
        }
        .grid-alt-row {
            background-color: #FFFFFF;
            text-align: center;
        }
        .grid-row:hover, .grid-alt-row:hover {
            background-color: #D1DDF1;
        }
        .node-link {
            color: #034af3;
            font-weight: bold;
            text-decoration: underline;
        }
        .node-link:hover {
            color: #c9302c;
        }
        .status-badge-closed {
            background-color: #5cb85c;
            color: #fff;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 11px;
            font-weight: bold;
        }
        .btn-back {
            background-color: #4b6c9e;
            color: #ffffff;
            border: none;
            padding: 6px 14px;
            border-radius: 3px;
            cursor: pointer;
            font-size: 13px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-back:hover {
            background-color: #2461BF;
            color: #ffffff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <div class="task-container">
        <div class="task-header">
            <h2 class="task-title">
                <asp:Label ID="lblPageHeader" runat="server" Text="Completed Task Details"></asp:Label>
            </h2>
            <span class="task-badge">Completed Records</span>
            <div style="float: right;">
                <a href="closedtask.aspx" class="btn-back">&laquo; Back to Completed Tasks Summary</a>
            </div>
            <div style="clear: both;"></div>
        </div>

        <div class="filter-bar">
            <table style="width: 100%;">
                <tr>
                    <td style="font-size: 14px;">
                        <b>Current LEA:</b> <asp:Label ID="lblLeaBreadcrumb" runat="server" ForeColor="#000066" Font-Bold="True"></asp:Label>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <span style="color: #666;">Click any <b>Node Name</b> below to view or edit the completed maintenance form.</span>
                    </td>
                    <td style="text-align: right;">
                        <span style="font-weight: bold; font-size: 13px;">Filter by Platform: </span>
                        <asp:DropDownList ID="ddlPlatformFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPlatformFilter_SelectedIndexChanged" style="padding: 4px 8px; font-size: 13px;">
                            <asp:ListItem Text="-- All Platforms --" Value="All"></asp:ListItem>
                            <asp:ListItem Text="ITMC" Value="ITMC"></asp:ListItem>
                            <asp:ListItem Text="SMW4" Value="SMW4"></asp:ListItem>
                            <asp:ListItem Text="DSCN" Value="DSCN"></asp:ListItem>
                            <asp:ListItem Text="BLCS" Value="BLCS"></asp:ListItem>
                            <asp:ListItem Text="MSAN" Value="MSAN"></asp:ListItem>
                            <asp:ListItem Text="IPNW" Value="IPNW"></asp:ListItem>
                            <asp:ListItem Text="SLBN/SDH" Value="SLBN/SDH"></asp:ListItem>
                            <asp:ListItem Text="Tower" Value="Tower"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>

        <div class="task-card">
            <asp:GridView ID="gvCompletedTasks" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="6" DataSourceID="dsCompletedTasks" 
                ForeColor="#333333" GridLines="None" HorizontalAlign="Center" PageSize="25" Width="100%">
                <HeaderStyle CssClass="grid-header" />
                <RowStyle CssClass="grid-row" />
                <AlternatingRowStyle CssClass="grid-alt-row" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" ItemStyle-Width="40px" />
                    <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:TemplateField HeaderText="Node Name" SortExpression="Node_Name" ItemStyle-Font-Bold="True">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlNode" runat="server" CssClass="node-link"
                                NavigateUrl='<%# Eval("SourceType").ToString() == "V2" ? ("NewMaintenanceForm.aspx?Form_ID=" + Eval("ID") + "&Node_Name=" + Server.UrlEncode(Eval("Node_Name").ToString()) + "&Platform=" + Server.UrlEncode(Eval("Platform").ToString()) + "&LEA_Name=" + Server.UrlEncode(Request.QueryString["LEA_Name"] ?? "") + "&End_Date=" + Server.UrlEncode(Eval("End_Date", "{0:yyyy-MM-dd}"))) : ("edit.aspx?Node_Name=" + Eval("Node_Name") + "&Platform=" + Eval("Platform") + "&End_Date=" + Eval("End_Date") + "&Type=" + Eval("Type")) %>'
                                Text='<%# Eval("Node_Name") %>' ToolTip="Click to view/edit maintenance form">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                    <asp:TemplateField HeaderText="Maintenance Task" SortExpression="Maintenance_Task" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%# FormatMaintenanceTasks(Eval("Maintenance_Task")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Start_Date" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" SortExpression="Start_Date" />
                    <asp:BoundField DataField="End_Date" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" SortExpression="End_Date" />
                    <asp:BoundField DataField="Completed_On" HeaderText="Completed On" DataFormatString="{0:yyyy-MM-dd}" SortExpression="Completed_On" />
                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                        <ItemTemplate>
                            <span class="status-badge-closed">
                                <%# Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Remark" HeaderText="Observations / Remarks" SortExpression="Remark" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                <EmptyDataTemplate>
                    <div style="text-align: center; padding: 25px; color: #666; font-size: 15px;">
                        No completed tasks found for the selected LEA and platform filters.
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>

            <asp:SqlDataSource ID="dsCompletedTasks" runat="server" CancelSelectOnNullParameter="false"
                ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" 
                SelectCommand="GetTaskDetailsup" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="All" Name="LEA_Name" QueryStringField="LEA_Name" Type="String" />
                    <asp:ControlParameter ControlID="ddlPlatformFilter" DefaultValue="All" Name="Platform" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
