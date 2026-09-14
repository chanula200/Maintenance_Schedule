<%@ Page Title="Add User" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Drawing" %>

<script runat="server">
    private void GetUserRoles(out bool isAdmin, out bool isNetworkEngineer, out string userProfile)
    {
        isAdmin = false;
        isNetworkEngineer = false;
        userProfile = "";

        string srvNo = Session["serviceno"] != null ? Session["serviceno"].ToString().Trim() : "";
        string sessionProf = Session["user_profile"] != null ? Session["user_profile"].ToString().Trim() : "";

        if (string.Equals(sessionProf, "admin", StringComparison.OrdinalIgnoreCase))
        {
            isAdmin = true;
            userProfile = "admin";
            return;
        }
        if (string.Equals(sessionProf, "Network Engineer", StringComparison.OrdinalIgnoreCase))
        {
            isNetworkEngineer = true;
            userProfile = "Network Engineer";
        }

        if (string.IsNullOrEmpty(srvNo))
        {
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // 1. Check dbo.Admin table
                string sqlAdmin = "SELECT COUNT(*) FROM dbo.Admin WHERE service_no = @srv OR service_no = RIGHT('000000' + @srv, 6) OR @srv = RIGHT('000000' + service_no, 6)";
                using (SqlCommand cmdA = new SqlCommand(sqlAdmin, conn))
                {
                    cmdA.Parameters.AddWithValue("@srv", srvNo);
                    int cnt = Convert.ToInt32(cmdA.ExecuteScalar());
                    if (cnt > 0)
                    {
                        isAdmin = true;
                        userProfile = "admin";
                        return;
                    }
                }

                // 2. Check dbo.users table
                string sqlUser = "SELECT TOP 1 profile FROM dbo.users WHERE Service_No = @srv OR Service_No = RIGHT('000000' + @srv, 6) OR @srv = RIGHT('000000' + Service_No, 6) OR REPLACE(LTRIM(REPLACE(Service_No, '0', ' ')), ' ', '0') = REPLACE(LTRIM(REPLACE(@srv, '0', ' ')), ' ', '0')";
                using (SqlCommand cmdU = new SqlCommand(sqlUser, conn))
                {
                    cmdU.Parameters.AddWithValue("@srv", srvNo);
                    object p = cmdU.ExecuteScalar();
                    if (p != null)
                    {
                        userProfile = p.ToString().Trim();
                        if (string.Equals(userProfile, "admin", StringComparison.OrdinalIgnoreCase))
                        {
                            isAdmin = true;
                        }
                        else if (string.Equals(userProfile, "Network Engineer", StringComparison.OrdinalIgnoreCase))
                        {
                            isNetworkEngineer = true;
                        }
                    }
                }
            }
        }
        catch
        {
            // fallback
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        bool isAdmin, isNetworkEngineer;
        string userProfile;
        GetUserRoles(out isAdmin, out isNetworkEngineer, out userProfile);

        // Only Admin and Network Engineer users have permission to access Add User page
        if (!isAdmin && !isNetworkEngineer)
        {
            Response.Redirect("access.aspx");
            return;
        }

        if (!IsPostBack)
        {
            DropDownList1.Items.Clear();

            if (isAdmin)
            {
                // Admin can ONLY add Network Engineers, but can delete ANY user profile
                DropDownList1.Items.Add(new ListItem("Network Engineer", "Network Engineer"));
                lblUserRoleNotice.Text = "<span style='color:#0284c7;font-weight:600;'>&#9432; Logged in as Administrator: You can add Network Engineers, and delete users from any profile.</span>";
            }
            else if (isNetworkEngineer)
            {
                // Network Engineer can add other profiles EXCEPT Network Engineer (and admin)
                DropDownList1.Items.Add(new ListItem("Platform Engineer", "Platform Engineer"));
                DropDownList1.Items.Add(new ListItem("ITMC", "ITMC"));
                DropDownList1.Items.Add(new ListItem("MTR CLS", "MTR CLS"));
                DropDownList1.Items.Add(new ListItem("CMB CLS", "CMB CLS"));
                DropDownList1.Items.Add(new ListItem("2nd Owner", "2nd Owner"));
                DropDownList1.Items.Add(new ListItem("3rd Owner", "3rd Owner"));
                DropDownList1.Items.Add(new ListItem("Tower Mtc Team", "Tower Mtc Team"));
                lblUserRoleNotice.Text = "<span style='color:#059669;font-weight:600;'>&#9432; Logged in as Network Engineer: You can add operational staff profiles, and delete users (except Network Engineers and Administrators).</span>";
            }

            Label5.Text = "";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        bool isAdmin, isNetworkEngineer;
        string userProfile;
        GetUserRoles(out isAdmin, out isNetworkEngineer, out userProfile);

        if (!isAdmin && !isNetworkEngineer)
        {
            Response.Redirect("access.aspx");
            return;
        }

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

        // Strict role validation
        if (isAdmin && !string.Equals(profile, "Network Engineer", StringComparison.OrdinalIgnoreCase))
        {
            Label5.Text = "Access Denied: Administrators can only add Network Engineers.";
            Label5.ForeColor = Color.Red;
            return;
        }

        if (isNetworkEngineer && (string.Equals(profile, "Network Engineer", StringComparison.OrdinalIgnoreCase) || string.Equals(profile, "admin", StringComparison.OrdinalIgnoreCase)))
        {
            Label5.Text = "Access Denied: Network Engineers cannot add Network Engineers or Administrators.";
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

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            bool isAdmin, isNetworkEngineer;
            string userProfile;
            GetUserRoles(out isAdmin, out isNetworkEngineer, out userProfile);

            DataRowView rowView = (DataRowView)e.Row.DataItem;
            string targetProfile = rowView != null && rowView["profile"] != DBNull.Value ? rowView["profile"].ToString().Trim() : "";
            bool targetIsNE = string.Equals(targetProfile, "Network Engineer", StringComparison.OrdinalIgnoreCase);
            bool targetIsAdmin = string.Equals(targetProfile, "admin", StringComparison.OrdinalIgnoreCase);

            bool canDelete = false;
            if (isAdmin)
            {
                // Admin can delete ANY user belonging to any profile
                canDelete = true;
            }
            else if (isNetworkEngineer && !targetIsNE && !targetIsAdmin)
            {
                // Network Engineers can delete other users except other Network Engineers and Admins
                canDelete = true;
            }

            if (e.Row.Cells.Count > 6)
            {
                TableCell actionCell = e.Row.Cells[6];
                if (!canDelete)
                {
                    foreach (Control c in actionCell.Controls)
                    {
                        c.Visible = false;
                    }
                    actionCell.Text = "<span style='color:#94a3b8;font-size:12px;' title='No permission to delete this profile'>&#8212;</span>";
                }
                else
                {
                    foreach (Control c in actionCell.Controls)
                    {
                        LinkButton lbtn = c as LinkButton;
                        if (lbtn != null && lbtn.CommandName == "Delete")
                        {
                            lbtn.OnClientClick = "return confirm('Are you sure you want to delete this user?');";
                            lbtn.Style["color"] = "#dc2626";
                            lbtn.Style["font-weight"] = "bold";
                        }
                    }
                }
            }
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        bool isAdmin, isNetworkEngineer;
        string userProfile;
        GetUserRoles(out isAdmin, out isNetworkEngineer, out userProfile);

        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

        string targetProfile = "";
        string connStr = ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT profile FROM dbo.users WHERE ID = @ID", conn))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    object obj = cmd.ExecuteScalar();
                    if (obj != null)
                    {
                        targetProfile = obj.ToString().Trim();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            e.Cancel = true;
            Label5.Text = "Error verifying user permissions: " + Server.HtmlEncode(ex.Message);
            Label5.ForeColor = Color.Red;
            return;
        }

        bool targetIsNE = string.Equals(targetProfile, "Network Engineer", StringComparison.OrdinalIgnoreCase);
        bool targetIsAdmin = string.Equals(targetProfile, "admin", StringComparison.OrdinalIgnoreCase);

        // Security check
        if (isAdmin)
        {
            // Admin can delete any user belonging to any profile
        }
        else if (isNetworkEngineer)
        {
            if (targetIsNE || targetIsAdmin)
            {
                e.Cancel = true;
                Label5.Text = "Access Denied: Network Engineers cannot delete Network Engineers or Administrators.";
                Label5.ForeColor = Color.Red;
                return;
            }
        }
        else
        {
            e.Cancel = true;
            Label5.Text = "Access Denied: You do not have permission to delete users.";
            Label5.ForeColor = Color.Red;
            return;
        }

        // Execute deletion
        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM dbo.users WHERE ID = @ID", conn))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.ExecuteNonQuery();
                }
            }

            e.Cancel = true; // Handled deletion explicitly
            Label5.Text = "User deleted successfully!";
            Label5.ForeColor = Color.Green;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            e.Cancel = true;
            Label5.Text = "Error deleting user: " + Server.HtmlEncode(ex.Message);
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
            <td colspan="3" style="padding: 8px 0;">
                <asp:Literal ID="lblUserRoleNotice" runat="server"></asp:Literal>
            </td>
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
                    DataKeyNames="ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="100%"
                    OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" ItemStyle-Width="40px" />
                        <asp:BoundField DataField="Service_No" HeaderText="Service No" SortExpression="Service_No" ItemStyle-Width="90px" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="profile" HeaderText="Profile" SortExpression="profile" ItemStyle-Width="140px" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="supervisor" HeaderText="Supervisor" SortExpression="supervisor" ItemStyle-Width="90px" />
                        <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center" />
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
                    SelectCommand="SELECT [ID], [Service_No], [Name], [profile], [Email], [supervisor] FROM [users] ORDER BY [ID] DESC">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
