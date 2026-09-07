<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Routine_Maintenance.login" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        // Auto-authenticate as Admin and redirect to welcome page
        Session["serviceno"] = "012264";
        Session["username"] = "Admin";
        Session["user_profile"] = "admin";
        Session["passwd"] = "";
        Response.Redirect("welcome.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style16
        {
            width: 81px;
            font-family: Andalus;
            height: 37px;
        }
        .style17
        {
            height: 37px;
        }
        .style14
        {
            color: #000066;
        }
        .style18
        {
            font-family: Andalus;
            font-size: small;
            height: 37px;
        }
        .style11
        {
            width: 81px;
            font-family: Andalus;
        }
        .style12
        {
            font-family: Andalus;
            font-size: small;
            height: 28px;
        }
        .style15
        {
            font-family: Andalus;
            font-weight: bold;
            color: #000066;
        }
        .style10
        {
            width: 157px;
            background-color: #FFFFFF;
            font-family: Andalus;
        }
        .style13
        {
            font-family: Andalus;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <div style="text-align: center; padding: 40px; font-family: Andalus;">
        <h2 style="color: #000066;">Login Bypassed</h2>
        <p style="font-size: 16px;">Authentication requirement has been commented / bypassed.</p>
        <p><a href="welcome.aspx" style="font-size: 18px; font-weight: bold; color: #4b6c9e;">Click here to enter the system</a></p>
    </div>

    <%-- LOGIN FORM COMMENTED OUT --%>
    <%--
    <p>
    <br />
    <table class="style1">
        <tr>
            <td class="style16">User Name: </td>
            <td class="style17">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="style12" Width="100px"></asp:TextBox>
                <span class="style14">&nbsp; <b>6 Digit SLT Service Number</b></span></td>
            <td class="style18"></td>
        </tr>
        <tr>
            <td class="style11" valign="top">Password:&nbsp;</td>
            <td class="style9">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="style12" TextMode="Password" Width="100px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CssClass="style12" Height="31px" onclick="Button1_Click" Text="Login" />
                &nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" CssClass="style12"></asp:Label>
            </td>
            <td class="style12">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </td>
        </tr>
        <tr>
            <td class="style15" colspan="2">Please use SLT Domain Username/ Password</td>
            <td class="style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="style13" colspan="3">
                <br />
            </td>
        </tr>
        <tr>
            <td class="style9" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="style9" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="style9" colspan="3">&nbsp;</td>
        </tr>
    </table>
    </p>
    --%>
</asp:Content>
