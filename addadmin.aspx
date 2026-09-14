<%@ Page Title="Add Administrator" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Drawing" %>

<script runat="server">
    private bool CheckIsAdmin()
    {
        string srvNo = Session["serviceno"] != null ? Session["serviceno"].ToString().Trim() : "";
        string sessionProf = Session["user_profile"] != null ? Session["user_profile"].ToString().Trim() : "";

        if (string.Equals(sessionProf, "admin", StringComparison.OrdinalIgnoreCase))
        {
            return true;
        }

        if (string.IsNullOrEmpty(srvNo))
        {
            return false;
        }

        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // 1. Check Admin table
                string sqlAdmin = "SELECT COUNT(*) FROM dbo.Admin WHERE service_no = @srv OR service_no = RIGHT('000000' + @srv, 6) OR @srv = RIGHT('000000' + service_no, 6)";
                using (SqlCommand cmdA = new SqlCommand(sqlAdmin, conn))
                {
                    cmdA.Parameters.AddWithValue("@srv", srvNo);
                    int cnt = Convert.ToInt32(cmdA.ExecuteScalar());
                    if (cnt > 0) return true;
                }

                // 2. Check users table for profile = 'admin'
                string sqlUser = "SELECT profile FROM dbo.users WHERE Service_No = @srv OR Service_No = RIGHT('000000' + @srv, 6) OR @srv = RIGHT('000000' + Service_No, 6)";
                using (SqlCommand cmdU = new SqlCommand(sqlUser, conn))
                {
                    cmdU.Parameters.AddWithValue("@srv", srvNo);
                    object p = cmdU.ExecuteScalar();
                    if (p != null && string.Equals(p.ToString().Trim(), "admin", StringComparison.OrdinalIgnoreCase))
                    {
                        return true;
                    }
                }
            }
        }
        catch
        {
            // fallback
        }

        return false;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Strictly restrict Add Admin page to Admin profiles only
        if (!CheckIsAdmin())
        {
            Response.Redirect("access.aspx");
            return;
        }

        if (!IsPostBack)
        {
            Label4.Text = "";
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (!CheckIsAdmin())
        {
            Response.Redirect("access.aspx");
            return;
        }

        string srvNo = TextBox3.Text.Trim();
        string name = TextBox2.Text.Trim();
        string email = TextBox4.Text.Trim();

        if (string.IsNullOrEmpty(srvNo) || string.IsNullOrEmpty(name))
        {
            Label4.Text = "Please enter Service Number and Name.";
            Label4.ForeColor = Color.Red;
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if admin already exists
                string checkSql = "SELECT COUNT(*) FROM dbo.Admin WHERE Service_No = @srv";
                using (SqlCommand cmdCheck = new SqlCommand(checkSql, conn))
                {
                    cmdCheck.Parameters.AddWithValue("@srv", srvNo);
                    int exists = Convert.ToInt32(cmdCheck.ExecuteScalar());
                    if (exists > 0)
                    {
                        Label4.Text = "Admin with Service No " + Server.HtmlEncode(srvNo) + " already exists!";
                        Label4.ForeColor = Color.Red;
                        return;
                    }
                }

                // Insert into dbo.Admin
                string insertSql = "INSERT INTO dbo.Admin (Service_No, Name, profile, Email) VALUES (@srv, @name, 'admin', @email)";
                using (SqlCommand cmdInsert = new SqlCommand(insertSql, conn))
                {
                    cmdInsert.Parameters.AddWithValue("@srv", srvNo);
                    cmdInsert.Parameters.AddWithValue("@name", name);
                    cmdInsert.Parameters.AddWithValue("@email", email);
                    cmdInsert.ExecuteNonQuery();
                }
            }

            Label4.Text = "Administrator " + Server.HtmlEncode(name) + " added successfully!";
            Label4.ForeColor = Color.Green;

            TextBox3.Text = "";
            TextBox2.Text = "";
            TextBox4.Text = "";

            GridView2.DataBind();
        }
        catch (Exception ex)
        {
            Label4.Text = "Error adding administrator: " + Server.HtmlEncode(ex.Message);
            Label4.ForeColor = Color.Red;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Add Administrator
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-label {
            font-weight: bold;
            color: #000066;
            font-size: 13px;
        }
        .form-input {
            padding: 5px 8px;
            font-size: 13px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .btn-add {
            background-color: #003399;
            color: #ffffff;
            font-weight: bold;
            padding: 6px 18px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .btn-add:hover {
            background-color: #002266;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <table class="style1" style="margin: 15px auto; width: 90%;">
        <tr>
            <td colspan="3" style="font-size: 20px; font-weight: bold; color: #003399; padding-bottom: 12px; border-bottom: 2px solid #003399;">
                Add Administrator
            </td>
        </tr>
        <tr>
            <td style="height: 15px;" colspan="3"></td>
        </tr>
        <tr>
            <td class="form-label" style="width: 120px; padding: 6px 0;">Service No:</td>
            <td style="padding: 6px 0;">
                <asp:TextBox ID="TextBox3" runat="server" Width="260px" CssClass="form-input"></asp:TextBox>
                <span style="font-size: 11px; color: #666; margin-left: 8px;">(6 Digit SLT Service Number)</span>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="form-label" style="padding: 6px 0;">Name:</td>
            <td style="padding: 6px 0;">
                <asp:TextBox ID="TextBox2" runat="server" Width="260px" CssClass="form-input"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="form-label" style="padding: 6px 0;">Email:</td>
            <td style="padding: 6px 0;">
                <asp:TextBox ID="TextBox4" runat="server" Width="260px" CssClass="form-input"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td style="padding: 12px 0;">
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Add Admin" CssClass="btn-add" />
                &nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 20px;"></td>
        </tr>
        <tr>
            <td colspan="3" style="padding-top: 15px;">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="1px" CellPadding="6" 
                    DataKeyNames="ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" ItemStyle-Width="40px" />
                        <asp:BoundField DataField="Service_No" HeaderText="Service No" SortExpression="Service_No" ItemStyle-Width="100px" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="profile" HeaderText="Profile" SortExpression="profile" ItemStyle-Width="120px" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" Height="32px" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" 
                    SelectCommand="SELECT [ID], [Service_No], [Name], [profile], [Email] FROM [Admin] ORDER BY [ID] DESC" 
                    DeleteCommand="DELETE FROM [Admin] WHERE [ID]=@ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
