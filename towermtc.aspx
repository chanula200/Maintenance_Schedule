<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="towermtc.aspx.cs" Inherits="Routine_Maintenance.towermtc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            font-size: small;
            color: #000000;
        }
        .auto-style3 {
            width: 4px;
        }
        .auto-style4 {
            font-size: small;
            color: #000000;
            height: 59px;
        }
        .auto-style5 {
            height: 59px;
        }
        .auto-style6 {
            width: 4px;
            height: 59px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="color: #000099; font-size: large; font-weight: bold">
        Tower Maintenance Schedule </p>
    <table>
    <tr>
        <td class="auto-style4">Network Engineer:</td>
        <td class="auto-style5">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Ntw_Eng" DataValueField="Ntw_Eng" Height="32px" Width="229px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT 'ALL' AS Ntw_Eng  UNION SELECT DISTINCT [Ntw_Eng] FROM lea2 where ntw_eng!='NULL' ORDER BY [Ntw_Eng ] asc;"></asp:SqlDataSource>
        </td>
        <td class="auto-style6"></td>
        <td class="auto-style6"></td>
    </tr>
    <tr>
        <td class="auto-style2">Tower_Location:</td>
        <td class="auto-style3">
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Node_Name" DataValueField="Node_Name" Height="35px" Width="230px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT 'ALL' AS Node_Name UNION SELECT distinct Node_Name FROM Schedule left join lea2 on schedule.LEA=lea2.LEA where schedule.Task!='Close' and Task='Tower Maintenance' and ntw_eng=@ntw_eng ORDER BY Node_Name asc;">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ntw_eng" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
    </tr>
</table>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:TemplateField HeaderText="Node_Name" SortExpression="Node_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Node_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "towermtcform.aspx?Node_Name=" + Eval("Node_Name") + "&Platform=" + Eval("Platform") + "&End_Date=" + Eval("End_Date") %>' Text='<%# Eval("Node_Name") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="platform" HeaderText="platform" SortExpression="platform" />
                <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
                <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="tmtc" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="ALL" Name="ntw_eng" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList2" DefaultValue="ALL" Name="Node_Name" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </p>
</asp:Content>
