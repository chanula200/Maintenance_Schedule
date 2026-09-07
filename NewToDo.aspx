<%@ Page Title="New To Do" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    New To Do Schedule (V2)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .v2-container {
            padding: 15px 25px;
            font-family: "Segoe UI", Arial, Helvetica, sans-serif;
        }
        .v2-header {
            margin-bottom: 20px;
            border-bottom: 2px solid #4b6c9e;
            padding-bottom: 10px;
        }
        .v2-title {
            color: #000066;
            font-size: 24px;
            font-weight: bold;
            margin: 0;
            display: inline-block;
        }
        .v2-badge {
            background-color: #2461BF;
            color: #ffffff;
            font-size: 12px;
            padding: 4px 10px;
            border-radius: 12px;
            margin-left: 10px;
            vertical-align: middle;
        }
        .v2-subtitle {
            color: #555555;
            font-size: 13px;
            margin-top: 5px;
        }
        .v2-card {
            background-color: #ffffff;
            border: 1px solid #dcdcdc;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .v2-card-title {
            font-size: 16px;
            font-weight: bold;
            color: #4b6c9e;
            margin-bottom: 12px;
            border-bottom: 1px solid #eee;
            padding-bottom: 6px;
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
        .lea-link {
            color: #2461BF;
            font-weight: bold;
            text-decoration: underline;
        }
        .lea-link:hover {
            color: #000066;
        }
        .btn-custom {
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
        .btn-custom:hover {
            background-color: #2461BF;
            color: #ffffff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <div class="v2-container">
        <div class="v2-header">
            <h2 class="v2-title">To Do List</h2>
            <span class="v2-badge">Schedule V2 & FormData V2</span>
            <div class="v2-subtitle">
                Maintenance tasks retrieved from <b>dbo.Schedule_V2</b> and <b>dbo.FormData_V2</b>. 
                Click any <b>LEA Name</b> to view its task details.
            </div>
        </div>

        <div class="v2-card">
            <div class="v2-card-title">
                <span>Task Summary by LEA & Platform</span>
                <div style="float: right;">
                    <a href="NewTaskDetails.aspx?LEA_Name=All" class="btn-custom">View All Task Details &raquo;</a>
                </div>
                <div style="clear: both;"></div>
            </div>

            <asp:GridView ID="gvSummary" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                CellPadding="6" DataSourceID="dsSummary" ForeColor="#333333" GridLines="None" 
                HorizontalAlign="Center" Width="100%">
                <HeaderStyle CssClass="grid-header" />
                <RowStyle CssClass="grid-row" />
                <AlternatingRowStyle CssClass="grid-alt-row" />
                <Columns>
                    <asp:TemplateField HeaderText="LEA Name" SortExpression="LEA_Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlLEA" runat="server" CssClass="lea-link"
                                NavigateUrl='<%# "NewTaskDetails.aspx?LEA_Name=" + Server.UrlEncode(Eval("LEA_Name").ToString()) %>' 
                                Text='<%# Eval("LEA_Name") %>' ToolTip="Click to view task details for this LEA">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MSAN" HeaderText="MSAN" ReadOnly="True" SortExpression="MSAN" />
                    <asp:BoundField DataField="IPNW" HeaderText="IPNW" ReadOnly="True" SortExpression="IPNW" />
                    <asp:BoundField DataField="SLBN_SDH" HeaderText="SLBN / SDH" ReadOnly="True" SortExpression="SLBN_SDH" />
                    <asp:BoundField DataField="Tower" HeaderText="Tower" ReadOnly="True" SortExpression="Tower" />
                    <asp:BoundField DataField="ITMC" HeaderText="ITMC" ReadOnly="True" SortExpression="ITMC" />
                    <asp:BoundField DataField="SMW4" HeaderText="SMW4" ReadOnly="True" SortExpression="SMW4" />
                    <asp:BoundField DataField="DSCN" HeaderText="DSCN" ReadOnly="True" SortExpression="DSCN" />
                    <asp:BoundField DataField="BLCS" HeaderText="BLCS" ReadOnly="True" SortExpression="BLCS" />
                    <asp:TemplateField HeaderText="Total Tasks" SortExpression="Total_Tasks" ItemStyle-Font-Bold="True" ItemStyle-ForeColor="#990000">
                        <ItemTemplate>
                            <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("Total_Tasks") %>'></asp:Label>
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
            </asp:GridView>

            <asp:SqlDataSource ID="dsSummary" runat="server" 
                ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" 
                SelectCommand="GetToDOList_V2" 
                SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
