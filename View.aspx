<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Routine_Maintenance.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <table>
    <tr>
        <td class="auto-style14" class="auto-style5" colspan="3" style="font-size: large; font-weight: bold; color: #000066">Maintenance Task Details for Recent Period</td>
        <td class="auto-style5"></td>
        <td class="auto-style6"></td>
    </tr>
    <tr>
        <td class="auto-style5" colspan="5">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td></td>
        <td class="auto-style17">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="color: #000000; font-size: small; font-weight: normal">Platform:</td>
        <td>
            <asp:DropDownList ID="DropDownList1" EnableViewState="false" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="platform" DataValueField="platform">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT 'ALL' AS PLATFORM UNION SELECT DISTINCT [PLATFORM] FROM [schedule] where platform!='eNodeB' ORDER BY [PLATFORM]"></asp:SqlDataSource>
        </td>
        <td class="auto-style17">&nbsp;</td>
        <td class="auto-style7">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3" colspan="2" style="font-size: small; font-weight: normal; color: #000000">Network Engineer:&nbsp; </td>
        <td class="auto-style3">
            <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Ntw_Eng" DataValueField="Ntw_Eng">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT 'ALL' AS Ntw_Eng  UNION SELECT DISTINCT [Ntw_Eng] FROM lea2 where ntw_eng!='NULL' ORDER BY [Ntw_Eng ] asc;"></asp:SqlDataSource>
        </td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3" colspan="2" style="font-size: small; font-weight: normal; color: #000000">Status:</td>
        <td class="auto-style3">
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="status" DataValueField="status">
                <asp:ListItem>ALL</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT 'ALL' AS status UNION SELECT DISTINCT [status] FROM [SCHEDULE] ORDER BY [STATUS]
"></asp:SqlDataSource>
        </td>
        <td class="auto-style3"></td>
        <td class="auto-style8"></td>
    </tr>
    <tr>
        <td class="auto-style2" colspan="2" style="font-size: small; font-weight: normal; color: #000000"></td>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style2"></td>
        <td class="auto-style9"></td>
    </tr>
    <tr>
        <td class="auto-style2" colspan="2" style="font-size: small; font-weight: normal; color: #000000"></td>
        <td class="auto-style2"></td>
        <td class="auto-style2"></td>
        <td class="auto-style9"></td>
    </tr>
    <tr>
        <td colspan="2" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
        <td class="auto-style13">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource3" OnRowDataBound="GridView1_RowDataBound1">
                <Columns>
                    <asp:BoundField DataField="LEA" HeaderText="LEA" SortExpression="LEA" />
                    <asp:BoundField DataField="LEA_Name" HeaderText="LEA_Name" SortExpression="LEA_Name" />
                    <asp:BoundField DataField="Ntw_Eng" HeaderText="Ntw_Eng" SortExpression="Ntw_Eng" />
                    <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                    <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                    <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                    <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
                    <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    <asp:BoundField DataField="status_datetime" HeaderText="status_datetime" SortExpression="status_datetime" />
                    <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" Visible="False" />
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
        </td>
    </tr>
</table>
    <%--  --%>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="Getview3" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Platform" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList4" Name="ntw_eng" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList3" Name="status" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
<p>
    &nbsp;</p>
</asp:Content>
