<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="asignlea.aspx.cs" Inherits="Routine_Maintenance.asignlea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <table class="style1">
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style4"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style11" colspan="2">Assign LEAs</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style3" colspan="2" style="color: #FF0000">*Select the correct service Number of owner2/3 before assign LEAs.</td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
            <td class="auto-style5">Owner Service No: </td>
            <td class="auto-style3"><span class="style14">&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Ntw_Eng" DataValueField="Ntw_Eng" Height="20px" Width="136px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT '~Select~' AS Ntw_Eng UNION select Service_No from users where supervisor=@supervisor;
">
                    <SelectParameters>
                        <asp:SessionParameter Name="supervisor" SessionField="serviceno" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </span></td>
        </tr>
        <tr>
            <td class="auto-style12" valign="top">&nbsp;</td>
            <td class="auto-style13" valign="top">Owner Name:</td>
            <td class="auto-style14">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Name" Height="20px" Width="229px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select Name from users where Service_No=@Service_No;
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Service_No" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style12" valign="top">&nbsp;</td>
            <td class="auto-style13" valign="top">Owner Profile</td>
            <td class="auto-style14">
                <asp:DropDownList ID="DropDownList3" runat="server" Height="20px" Width="186px" DataSourceID="SqlDataSource4" DataTextField="profile" DataValueField="profile">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select profile from users where Service_No=@serviceno">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="serviceno" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style12" valign="top"></td>
            <td class="auto-style13" valign="top"></td>
            <td class="auto-style14">&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button2_Click" Text="Assign" />
                &nbsp;<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style10" valign="top">&nbsp;</td>
            <td class="style11" colspan="2" valign="top">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8" valign="top"></td>
            <td class="auto-style2" colspan="2" valign="top"></td>
        </tr>
        <tr>
            <td class="auto-style10" valign="top">&nbsp;</td>
            <td class="style11" colspan="2" valign="top">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" HorizontalAlign="Center" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="Select All">
                            <HeaderTemplate>
                                <asp:CheckBox ID="Chkheader" runat="server" AutoPostBack="true" Text="Select All" OnCheckedChanged="Chkheader_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ChkEmpty" runat="server" OnCheckedChaged="ChkEmpty_CheckChanaged" OnCheckedChanged="ChkEmpty_CheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                        <asp:BoundField DataField="LEA" HeaderText="LEA" SortExpression="LEA" />
                        <asp:BoundField DataField="LEA_name" HeaderText="LEA_name" SortExpression="LEA_name" />
                        <asp:BoundField DataField="service_no" HeaderText="service_no" SortExpression="service_no" />
                        <asp:BoundField DataField="ntw_eng" HeaderText="ntw_eng" SortExpression="ntw_eng" />
                        <asp:BoundField DataField="Owner2" HeaderText="Owner2" SortExpression="Owner2" />
                        <asp:BoundField DataField="Owner2_name" HeaderText="Owner2_name" SortExpression="Owner2_name" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" DeleteCommand="delete from users where id=@id" SelectCommand="select Id,LEA,LEA_name,service_no,ntw_eng,Owner2, Owner2_name from lea2 where service_no=@service_no order by LEA;">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="service_no" SessionField="serviceno" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
