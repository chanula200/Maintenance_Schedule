<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addnode.aspx.cs" Inherits="Routine_Maintenance.addnode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


    .auto-style2 {
        width: 10px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <table class="style1">
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3" colspan="2" style="font-size: large; font-weight: bold; color: #000099">Add New Node</td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2"></td>
        <td class="auto-style5">Node_Name:</td>
        <td class="auto-style3"><span class="style14">
            <asp:TextBox ID="TextBox3" runat="server" Width="222px"></asp:TextBox>
            &nbsp;</span></td>
        <td class="auto-style3"></td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style5">LEA</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox2" runat="server" Width="222px"></asp:TextBox>
        </td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style6" valign="top">LEA Name</td>
        <td class="style9">
            <asp:TextBox ID="TextBox5" runat="server" Width="222px"></asp:TextBox>
        </td>
        <td class="style12">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style6" valign="top">Platform</td>
        <td class="style9">
            <asp:TextBox ID="TextBox4" runat="server" Width="222px"></asp:TextBox>
        </td>
        <td class="style12">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style6" valign="top">Type</td>
        <td class="style9">
            <asp:TextBox ID="TextBox6" runat="server" Width="222px"></asp:TextBox>
        </td>
        <td class="style12">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style6" valign="top">&nbsp;</td>
        <td class="style9">
            &nbsp;</td>
        <td class="style12">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style6" valign="top">&nbsp;</td>
        <td class="style9">&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button2_Click" Text="Add Node" />
            &nbsp;<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;
            <br />
        </td>
        <td class="style12">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="style11" colspan="3" valign="top">&nbsp;</td>
    </tr>
</table>
    <p style="font-size: medium; font-weight: bold; color: #000099">
        &nbsp;</p>
</asp:Content>
