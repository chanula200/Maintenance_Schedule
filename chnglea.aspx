<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="chnglea.aspx.cs" Inherits="Routine_Maintenance.chnglea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    .auto-style3 {
        height: 26px;
    }
    .auto-style2 {
        font-weight: bold;
        font-size: large;
        color: #003399;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <table class="style1">
    <tr>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style2" colspan="2">Change Ntw Engineer for a LEA</td>
    </tr>
    <tr>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style5">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style9"></td>
        <td class="auto-style5">LEA Code: </td>
        <td class="auto-style3"><span class="style14">&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="lea" DataValueField="lea">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT '~ALL~' AS lea UNION SELECT DISTINCT [lea] FROM [lea2]ORDER BY [lea]"></asp:SqlDataSource>
            &nbsp;
&nbsp;&nbsp; </span></td>
    </tr>
    <tr>
        <td class="auto-style9" colspan="3">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="lea" SelectCommandType="StoredProcedure" UpdateCommand="update lea2 set ntw_eng=@ntw_eng, service_no=@service_no where ID=@ID;">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="LEA" PropertyName="SelectedValue" Type="String" DefaultValue="ALL" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ntw_eng" />
                    <asp:Parameter Name="service_no" />
                    <asp:Parameter Name="ID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style9" colspan="3">&nbsp;</td>
    </tr>
</table>
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="Zone" HeaderText="Zone" SortExpression="Zone" Visible="False" />
                    <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" Visible="False" />
                    <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" Visible="False" />
                    <asp:BoundField DataField="RTOM" HeaderText="RTOM" SortExpression="RTOM" Visible="False" />
                    <asp:BoundField DataField="RTOM1" HeaderText="RTOM1" SortExpression="RTOM1" Visible="False" />
                    <asp:BoundField DataField="LEA" HeaderText="LEA" SortExpression="LEA" />
                    <asp:BoundField DataField="LEA_name" HeaderText="LEA_name" SortExpression="LEA_name" />
                    <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation" Visible="False" />
                    <asp:BoundField DataField="ntw_eng" HeaderText="ntw_eng" SortExpression="ntw_eng" />
                    <asp:BoundField DataField="service_no" HeaderText="service_no" SortExpression="service_no" />
                    <asp:BoundField DataField="Owner2" HeaderText="Owner2" SortExpression="Owner2" />
                    <asp:BoundField DataField="Owner2_Name" HeaderText="Owner2_Name" SortExpression="Owner2_Name" />
                    <asp:BoundField DataField="Owner3" HeaderText="Owner3" SortExpression="Owner3" />
                    <asp:BoundField DataField="Owner3_name" HeaderText="Owner3_name" SortExpression="Owner3_name" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            </asp:Content>
