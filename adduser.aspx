<%@ Page Title="Add User" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Drawing" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.Items.Clear();
            DropDownList1.Items.Add(new ListItem("Network Engineer", "Network Engineer"));
            DropDownList1.Items.Add(new ListItem("Platform Engineer", "Platform Engineer"));
            DropDownList1.Items.Add(new ListItem("ITMC", "ITMC"));
            DropDownList1.Items.Add(new ListItem("MTR CLS", "MTR CLS"));
            DropDownList1.Items.Add(new ListItem("CMB CLS", "CMB CLS"));
            DropDownList1.Items.Add(new ListItem("2nd Owner", "2nd Owner"));
            DropDownList1.Items.Add(new ListItem("3rd Owner", "3rd Owner"));
            DropDownList1.Items.Add(new ListItem("Tower Mtc Team", "Tower Mtc Team"));
            
            Label5.Text = "";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string srvNo = TextBox5.Text.Trim();
        string name = TextBox6.Text.Trim();
        string email = TextBox4.Text.Trim();
        string profile = DropDownList1.SelectedValue;

        if (string.IsNullOrEmpty(srvNo) || string.IsNullOrEmpty(name))
        {
            Label5.Text = "Please enter Service Number and Name.";
            Label5.ForeColor = Color.Red;
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if user already exists
                string checkSql = "SELECT COUNT(*) FROM dbo.users WHERE Service_No = @srv";
                using (SqlCommand cmdCheck = new SqlCommand(checkSql, conn))
                {
                    cmdCheck.Parameters.AddWithValue("@srv", srvNo);
                    int exists = Convert.ToInt32(cmdCheck.ExecuteScalar());
                    if (exists > 0)
                    {
                        Label5.Text = "Service No " + Server.HtmlEncode(srvNo) + " already exists!";
                        Label5.ForeColor = Color.Red;
                        return;
                    }
                }

                // Insert new user
                string insertSql = "INSERT INTO dbo.users (Service_No, Name, Email, profile) VALUES (@srv, @name, @email, @profile)";
                using (SqlCommand cmdInsert = new SqlCommand(insertSql, conn))
                {
                    cmdInsert.Parameters.AddWithValue("@srv", srvNo);
                    cmdInsert.Parameters.AddWithValue("@name", name);
                    cmdInsert.Parameters.AddWithValue("@email", email);
                    cmdInsert.Parameters.AddWithValue("@profile", profile);
                    cmdInsert.ExecuteNonQuery();
                }
            }

            Label5.Text = "User " + Server.HtmlEncode(name) + " (" + Server.HtmlEncode(profile) + ") added successfully!";
            Label5.ForeColor = Color.Green;
            
            // Clear inputs
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox4.Text = "";
            
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label5.Text = "Error adding user: " + Server.HtmlEncode(ex.Message);
            Label5.ForeColor = Color.Red;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Add User
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
                Add User
            </td>
        </tr>
        <tr>
            <td style="height: 15px;" colspan="3"></td>
        </tr>
        <tr>
            <td class="form-label" style="width: 120px; padding: 6px 0;">Service No:</td>
            <td style="padding: 6px 0;">
                <asp:TextBox ID="TextBox5" runat="server" Width="260px" CssClass="form-input"></asp:TextBox>
                <span style="font-size: 11px; color: #666; margin-left: 8px;">(6 Digit SLT Service Number)</span>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="form-label" style="padding: 6px 0;">Name:</td>
            <td style="padding: 6px 0;">
                <asp:TextBox ID="TextBox6" runat="server" Width="260px" CssClass="form-input"></asp:TextBox>
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
            <td class="form-label" style="padding: 6px 0;">Profile:</td>
            <td style="padding: 6px 0;">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="260px" CssClass="form-input">
                </asp:DropDownList>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td style="padding: 12px 0;">
                <asp:Button ID="Button3" runat="server" OnClick="Button2_Click" Text="Add User" CssClass="btn-add" />
                &nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 20px;"></td>
        </tr>
        <tr>
            <td colspan="3" style="padding-top: 15px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="1px" CellPadding="6" 
                    DataKeyNames="ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" ItemStyle-Width="40px" />
                        <asp:BoundField DataField="Service_No" HeaderText="Service No" SortExpression="Service_No" ItemStyle-Width="90px" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="profile" HeaderText="Profile" SortExpression="profile" ItemStyle-Width="130px" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="supervisor" HeaderText="Supervisor" SortExpression="supervisor" ItemStyle-Width="90px" />
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
                    SelectCommand="SELECT [ID], [Service_No], [Name], [profile], [Email], [supervisor] FROM [users] ORDER BY [ID] DESC" 
                    DeleteCommand="DELETE FROM [users] WHERE [ID]=@ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
