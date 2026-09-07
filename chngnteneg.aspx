<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="chngnteneg.aspx.cs" Inherits="Routine_Maintenance.chngnteneg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        font-weight: bold;
        font-size: large;
        color: #003399;
    }
    .auto-style3 {
        height: 26px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
    <table class="style1">
    <tr>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style2" colspan="2">Change Network Engineer</td>
    </tr>
    <tr>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style9"></td>
        <td class="auto-style5">Existing Ntw Engineer&#39;s service no: </td>
        <td class="auto-style3"><span class="style14">
            <asp:TextBox ID="TextBox5" runat="server" Width="148px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp; </span></td>
    </tr>
    <tr>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3"></td>
        <td class="auto-style3">New Ntw Engineer:</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox6" runat="server" Width="151px" Height="19px"></asp:TextBox>
        &nbsp;&nbsp;
            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style8" valign="top">&nbsp;</td>
        <td class="auto-style4" valign="top">&nbsp;</td>
        <td class="auto-style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style8" valign="top"></td>
        <td class="auto-style4" valign="top">&nbsp;</td>
        <td class="auto-style2">
            &nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Search" />
        </td>
    </tr>
    <tr>
        <td class="auto-style10" valign="top">&nbsp;</td>
        <td class="auto-style6" valign="top">&nbsp;</td>
        <td class="style9">&nbsp;&nbsp;&nbsp;<asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Change" Visible="False" />
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;
            <br />
        </td>
    </tr>
</table>
</p>
</asp:Content>
