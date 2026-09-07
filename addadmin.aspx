<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addadmin.aspx.cs" Inherits="Routine_Maintenance.addadmin" %>
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
        <td class="auto-style3" colspan="2" style="font-size: large; font-weight: bold; color: #000099">Add Administrator</td>
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
        <td class="auto-style5">Service No: </td>
        <td class="auto-style3"><span class="style14">
            <asp:TextBox ID="TextBox3" runat="server" Width="222px"></asp:TextBox>
            &nbsp;</span></td>
        <td class="auto-style3"></td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style5">Name</td>
        <td class="auto-style3">
            <asp:TextBox ID="TextBox2" runat="server" Width="222px"></asp:TextBox>
        </td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style6" valign="top">Email:</td>
        <td class="style9">
            <asp:TextBox ID="TextBox4" runat="server" Width="222px"></asp:TextBox>
        </td>
        <td class="style12">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style6" valign="top">&nbsp;</td>
        <td class="style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Add Admin" />
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
        </td>
        <td class="style12">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="style11" colspan="3" valign="top">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top"></td>
        <td class="auto-style2" valign="top"></td>
        <td class="auto-style2" colspan="3" valign="top"></td>
    </tr>
    <tr>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="auto-style2" valign="top">&nbsp;</td>
        <td class="style11" colspan="3" valign="top">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Service_No" HeaderText="Service_No" SortExpression="Service_No" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="profile" HeaderText="profile" SortExpression="profile" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT [ID], [Service_No], [Name], [profile], [Email] FROM [Admin] " DeleteCommand="Delete from users where ID=@ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>
