<%@ Page Title="New Task Details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string lea = Request.QueryString["LEA_Name"];
            if (!string.IsNullOrEmpty(lea) && lea != "All")
            {
                lblPageHeader.Text = "Task Details for LEA: " + Server.HtmlEncode(lea);
                lblLeaBreadcrumb.Text = Server.HtmlEncode(lea);
            }
            else
            {
                lblPageHeader.Text = "All Active Tasks (All LEAs)";
                lblLeaBreadcrumb.Text = "All LEAs";
            }
        }
    }

    protected void ddlPlatformFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvTaskDetails.PageIndex = 0;
        gvTaskDetails.DataBind();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    New Task Details (V2)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
            background-color: #2461BF;
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
        .status-badge-pending {
            background-color: #f0ad4e;
            color: #fff;
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 11px;
            font-weight: bold;
        }
        .status-badge-open {
            background-color: #5bc0de;
            color: #fff;
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 11px;
            font-weight: bold;
        }
        .status-badge-closed {
            background-color: #5cb85c;
            color: #fff;
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 11px;
            font-weight: bold;
        }
        .status-badge-other {
            background-color: #777;
            color: #fff;
            padding: 2px 8px;
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
                <asp:Label ID="lblPageHeader" runat="server" Text="Task Details"></asp:Label>
            </h2>
            <span class="task-badge">Schedule V2 & FormData V2</span>
            <div style="float: right;">
                <a href="NewToDo.aspx" class="btn-back">&laquo; Back to New To Do Summary</a>
            </div>
            <div style="clear: both;"></div>
        </div>

        <div class="filter-bar">
            <table style="width: 100%;">
                <tr>
                    <td style="font-size: 14px;">
                        <b>Current LEA:</b> <asp:Label ID="lblLeaBreadcrumb" runat="server" ForeColor="#000066" Font-Bold="True"></asp:Label>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <span style="color: #666;">Click any <b>Node Name</b> below to open its maintenance form.</span>
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
            <asp:GridView ID="gvTaskDetails" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="6" DataSourceID="dsTaskDetails" 
                ForeColor="#333333" GridLines="None" HorizontalAlign="Center" PageSize="25" Width="100%">
                <HeaderStyle CssClass="grid-header" />
                <RowStyle CssClass="grid-row" />
                <AlternatingRowStyle CssClass="grid-alt-row" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" ItemStyle-Width="40px" />
                    <asp:BoundField DataField="LEA_Name" HeaderText="LEA" SortExpression="LEA_Name" />
                    <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:TemplateField HeaderText="Node Name" SortExpression="Node_Name" ItemStyle-Font-Bold="True">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlNode" runat="server" CssClass="node-link"
                                NavigateUrl='<%# "NewMaintenanceForm.aspx?Form_ID=" + Eval("ID") + "&Node_Name=" + Server.UrlEncode(Eval("Node_Name").ToString()) + "&Platform=" + Server.UrlEncode(Eval("Platform").ToString()) + "&LEA_Name=" + Server.UrlEncode(Eval("LEA_Name").ToString()) + "&Frequency=" + Server.UrlEncode(Eval("Frequency").ToString()) + "&End_Date=" + Server.UrlEncode(Eval("End_Date", "{0:yyyy-MM-dd}")) %>'
                                Text='<%# Eval("Node_Name") %>' ToolTip="Click to open maintenance form for this task">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                    <asp:BoundField DataField="Maintenance_Task" HeaderText="Maintenance Task" SortExpression="Maintenance_Task" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" />
                    <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
                    <asp:BoundField DataField="Scheduled_Date" HeaderText="Scheduled Date" DataFormatString="{0:yyyy-MM-dd}" SortExpression="Scheduled_Date" />
                    <asp:BoundField DataField="End_Date" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" SortExpression="End_Date" />
                    <asp:TemplateField HeaderText="Status" SortExpression="Status">
                        <ItemTemplate>
                            <span class='<%# Eval("Status").ToString() == "Pending" ? "status-badge-pending" : (Eval("Status").ToString() == "Open" ? "status-badge-open" : (Eval("Status").ToString() == "Closed" ? "status-badge-closed" : "status-badge-other")) %>'>
                                <%# Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
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
                        No tasks found for the selected LEA and platform filters.
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>

            <asp:SqlDataSource ID="dsTaskDetails" runat="server" 
                ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" 
                SelectCommand="GetTaskDetails_V2" 
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="All" Name="LEA_Name" QueryStringField="LEA_Name" Type="String" />
                    <asp:ControlParameter ControlID="ddlPlatformFilter" DefaultValue="All" Name="Platform" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
