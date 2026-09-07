<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="towertask_Details.aspx.cs" Inherits="Routine_Maintenance.towertask_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    .auto-style16 {
        width: 82px;
        height: 29px;
    }
        .auto-style22 {
            font-size: small;
            color: #000000;
            font-weight: normal;
            height: 30px;
        }
        .auto-style19 {
            font-size: small;
            color: #000000;
            font-weight: normal;
            height: 59px;
        }
        .auto-style20 {
            width: 82px;
            height: 59px;
        }
        .auto-style21 {
            width: 138px;
            height: 59px;
        }
        .auto-style13 {
            width: 82px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="font-size: large; font-weight: bold; color: #000066">
        Task Details</p>
    <p style="font-size: large; font-weight: bold; color: #000066">
        &nbsp;</p>
    <asp:Panel ID="Panel2" runat="server">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:TemplateField HeaderText="Node_Name" SortExpression="Node_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Node_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "towerform.aspx?Node_Name=" + Eval("Node_Name") + "&Platform=" + Eval("Platform") + "&End_Date=" + Eval("End_Date") %>' Text='<%# Bind("node_name") %>' Target="_blank"></asp:HyperLink>

                          </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="priority" HeaderText="priority" SortExpression="priority" />
                <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
                <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
                <asp:BoundField DataField="Completed_On" HeaderText="Completed_On" SortExpression="Completed_On" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand=" select schedule.ID,Platform,schedule.Type,Node_Name,priority, Start_Date, End_Date, status_datetime as Completed_On, Status from Schedule LEFT JOIN tower ON schedule.Node_Name= tower.tower_location where network_engineer=@network_engineer and Status != 'Close' and platform ='Tower' and task='Tower Maintenance Regional' and SYSDATETIME() BETWEEN Schedule.VSdate AND Schedule.VEdate  order by Platform asc;" UpdateCommand="Update shedule set Remark=@REMARK, Remark_datetime= SYSDATETIME() where Node_Name=@Node_Name;">
            <SelectParameters>
                <asp:QueryStringParameter Name="network_engineer" QueryStringField="network_engineer" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="REMARK" />
                <asp:Parameter Name="Node_Name" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server">
        <table class="auto-style2" style="font-size: large; font-weight: bold; color: #000066">
            <tr>
                <td class="auto-style21" style="font-size: large; font-weight: bold; color: #000066">&nbsp;</td>
                <td class="auto-style19"></td>
                <td class="auto-style19" colspan="18"></td>
                <td class="auto-style20"></td>
            </tr>
            <tr>
                <td class="auto-style19" colspan="17" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
                <td class="auto-style16"></td>
                <td class="auto-style16"></td>
                <td class="auto-style16"></td>
                <td class="auto-style20"></td>
            </tr>
            <tr>
                <td class="auto-style22" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style22" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
                <td style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td colspan="8">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style22" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="21" style="font-size: small; font-weight: normal; color: #000000">&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
