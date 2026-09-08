<%@ Page Title="Completed Tasks" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand("GetupdateList", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindData();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Completed Tasks
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
        .task-card {
            background-color: #ffffff;
            border: 1px solid #dcdcdc;
            border-radius: 4px;
            padding: 15px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
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
            color: #034af3;
            font-weight: bold;
            text-decoration: underline;
        }
        .lea-link:hover {
            color: #c9302c;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <div class="task-container">
        <div class="task-header">
            <h2 class="task-title">Completed Maintenance Tasks Summary</h2>
            <div style="color: #666; font-size: 13px; margin-top: 5px;">
                Click any <b>LEA Name</b> below to view all completed maintenance task records.
            </div>
        </div>

        <div class="task-card">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="25" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="6" OnPageIndexChanging="GridView1_PageIndexChanging"
                ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="100%">
                <HeaderStyle CssClass="grid-header" />
                <RowStyle CssClass="grid-row" />
                <AlternatingRowStyle CssClass="grid-alt-row" />
                <Columns>
                    <asp:TemplateField HeaderText="LEA Name" SortExpression="LEA_Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="lea-link" 
                                NavigateUrl='<%# Bind("LEA_Name", "updatetask.aspx?&URL=ToDo&LEA_Name={0}") %>' 
                                Text='<%# Bind("LEA_Name") %>' ToolTip="Click to view completed tasks for this LEA">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Completed" HeaderText="Completed Tasks Count" ReadOnly="True" SortExpression="Completed" ItemStyle-Font-Bold="True" ItemStyle-ForeColor="#006600" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                <EmptyDataTemplate>
                    <div style="text-align: center; padding: 20px; color: #666; font-size: 14px;">
                        No completed task records found.
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
