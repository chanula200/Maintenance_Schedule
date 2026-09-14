<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs"
    Inherits="Routine_Maintenance.login" %>

    <script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Text = "";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string srv = TextBox1.Text.Trim();
        string pwd = TextBox2.Text.Trim();

        if (string.IsNullOrEmpty(srv))
        {
            Label1.Text = "Please enter your 6-digit SLT Service Number.";
            Label1.ForeColor = System.Drawing.Color.Red;
            return;
        }

        string name = "";
        string prof = "";
        bool found = false;

        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["PMSConnectionString"].ConnectionString;
        try
        {
            using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connStr))
            {
                conn.Open();
                // 1. Check Admin table
                using (System.Data.SqlClient.SqlCommand cmdA = new System.Data.SqlClient.SqlCommand(
                    "SELECT TOP 1 Name, profile FROM dbo.Admin WHERE (Service_No = @srv OR Service_No = RIGHT('000000' + @srv, 6) OR @srv = RIGHT('000000' + Service_No, 6)) AND (Name IS NOT NULL AND LTRIM(RTRIM(Name)) <> '')", conn))
                {
                    cmdA.Parameters.AddWithValue("@srv", srv);
                    using (System.Data.SqlClient.SqlDataReader r = cmdA.ExecuteReader())
                    {
                        if (r.Read())
                        {
                            name = r["Name"] != DBNull.Value ? r["Name"].ToString().Trim() : srv;
                            prof = "admin";
                            found = true;
                        }
                    }
                }

                // 2. Check users table
                if (!found)
                {
                    using (System.Data.SqlClient.SqlCommand cmdU = new System.Data.SqlClient.SqlCommand(
                        "SELECT TOP 1 Name, profile FROM dbo.users WHERE Service_No = @srv OR Service_No = RIGHT('000000' + @srv, 6) OR @srv = RIGHT('000000' + Service_No, 6) OR REPLACE(LTRIM(REPLACE(Service_No, '0', ' ')), ' ', '0') = REPLACE(LTRIM(REPLACE(@srv, '0', ' ')), ' ', '0')", conn))
                    {
                        cmdU.Parameters.AddWithValue("@srv", srv);
                        using (System.Data.SqlClient.SqlDataReader r = cmdU.ExecuteReader())
                        {
                            if (r.Read())
                            {
                                name = r["Name"] != DBNull.Value ? r["Name"].ToString().Trim() : srv;
                                prof = r["profile"] != DBNull.Value ? r["profile"].ToString().Trim() : "user";
                                found = true;
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Label1.Text = "Database connection error: " + ex.Message;
            Label1.ForeColor = System.Drawing.Color.Red;
            return;
        }

        // Try LDAP authentication if reachable in corporate network
        try
        {
            if (!string.IsNullOrEmpty(pwd))
            {
                Type deType = Type.GetType("System.DirectoryServices.DirectoryEntry, System.DirectoryServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a");
                Type dsType = Type.GetType("System.DirectoryServices.DirectorySearcher, System.DirectoryServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a");
                if (deType != null && dsType != null)
                {
                    using (IDisposable entry = (IDisposable)Activator.CreateInstance(deType, "LDAP://intranet.slt.com.lk", srv, pwd))
                    {
                        using (IDisposable searcher = (IDisposable)Activator.CreateInstance(dsType, entry))
                        {
                            dsType.GetProperty("Filter").SetValue(searcher, "(sAMAccountName=" + srv + ")", null);
                            object res = dsType.GetMethod("FindOne", Type.EmptyTypes).Invoke(searcher, null);
                            if (res != null && string.IsNullOrEmpty(name))
                            {
                                name = srv;
                            }
                        }
                    }
                }
            }
        }
        catch
        {
            // LDAP server unreachable in current network environment - ignore and proceed with DB authentication
        }

        if (found)
        {
            Session["serviceno"] = srv;
            Session["username"] = !string.IsNullOrEmpty(name) ? name : srv;
            Session["user_profile"] = !string.IsNullOrEmpty(prof) ? prof : "user";
            Session["passwd"] = pwd;
            Response.Redirect("welcome.aspx");
        }
        else
        {
            Label1.Text = "Invalid Service Number or User Not Found.";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
    }
    </script>

    <asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
        Maintenance Schedule - Login
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
            .style16 {
                width: 100px;
                font-family: Andalus;
                height: 37px;
                font-weight: bold;
                color: #000066;
            }

            .style17 {
                height: 37px;
            }

            .style14 {
                color: #000066;
                font-family: Andalus;
            }

            .style18 {
                font-family: Andalus;
                font-size: small;
                height: 37px;
            }

            .style11 {
                width: 100px;
                font-family: Andalus;
                font-weight: bold;
                color: #000066;
            }

            .style12 {
                font-family: Andalus;
                font-size: 14px;
                padding: 4px 8px;
            }

            .style15 {
                font-family: Andalus;
                font-weight: bold;
                color: #000066;
            }

            .style10 {
                width: 157px;
                background-color: #FFFFFF;
                font-family: Andalus;
            }

            .login-box {
                margin: 40px auto;
                width: 480px;
                padding: 25px 30px;
                background-color: #f7f9fc;
                border: 1px solid #d0d7de;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
        <div class="login-box">
            <h3 style="color: #000066; font-family: Andalus; margin-top: 0; border-bottom: 2px solid #4b6c9e; padding-bottom: 8px;">User Login</h3>
            <table class="style1" style="width: 100%;">
                <tr>
                    <td class="style16">User Name: </td>
                    <td class="style17">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="style12" Width="140px"></asp:TextBox>
                        <span class="style14">&nbsp; <b>6 Digit SLT Service Number</b></span>
                    </td>
                    <td class="style18"></td>
                </tr>
                <tr>
                    <td class="style11" valign="top">Password:&nbsp;</td>
                    <td class="style9">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="style12" TextMode="Password"
                            Width="140px"></asp:TextBox>
                        &nbsp;
                        <asp:Button ID="Button1" runat="server" CssClass="style12" Height="31px"
                            OnClick="Button1_Click" Text="Login" BackColor="#4b6c9e" ForeColor="White" Font-Bold="True" style="cursor: pointer;" />
                    </td>
                    <td class="style12"></td>
                </tr>
                <tr>
                    <td colspan="3" style="padding-top: 10px;">
                        <asp:Label ID="Label1" runat="server" CssClass="style12" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style15" colspan="2" style="padding-top: 12px;">Please use SLT Domain Username/ Password</td>
                    <td class="style10">&nbsp;</td>
                </tr>
            </table>
        </div>
    </asp:Content>