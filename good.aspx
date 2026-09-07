<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="good.aspx.cs" Inherits="maintenance_schedule.good" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="font-size: large; font-weight: bold; color: #000066">
    Details of The Towers which Oerall Status is Good</p>
<p style="font-size: large; font-weight: bold; color: #000066">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Size="Small" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:TemplateField HeaderText="Node_Name" SortExpression="Node_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Node_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "reportdownload.aspx?Node_Name=" + Eval("Node_Name") + "&Platform=" + Eval("Platform") + "&End_Date=" + Eval("End_Date") %>' Text='<%# Bind("Node_Name") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="lea" HeaderText="lea" SortExpression="lea" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
            <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
            <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            <asp:BoundField DataField="status_datetime" HeaderText="status_datetime" SortExpression="status_datetime" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select schedule.id,schedule.Node_Name, schedule.lea,schedule.platform,schedule.Type,schedule.Task,schedule.Priority,schedule.Remark,schedule.Start_Date,schedule.End_Date,schedule.status,schedule.status_datetime  from schedule left join formdata on schedule.Node_Name=formdata.node_name  and schedule.End_Date=formdata.End_Date where formdata.Status='good' and schedule.Platform='Tower' and schedule.status='Close' and schedule.status_datetime=@period
">
        <SelectParameters>
            <asp:QueryStringParameter Name="period" QueryStringField="textboxValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>
