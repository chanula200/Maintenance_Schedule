<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="report3.aspx.cs" Inherits="Routine_Maintenance.report3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            font-weight: bold;
            font-size: large;
            color: #000066;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p class="auto-style2">
        Completed Task</p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Size="Small" GridLines="Horizontal" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:TemplateField HeaderText="Node_Name" SortExpression="Node_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Node_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "report1.aspx?Node_Name=" + Eval("Node_Name") + "&Platform=" + Eval("Platform") + "&End_Date=" + Eval("End_Date") %>' Text='<%# Eval("Node_Name") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="lea" HeaderText="lea" SortExpression="lea" />
                <asp:BoundField DataField="platform" HeaderText="platform" SortExpression="platform" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
                <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                <asp:BoundField DataField="status_datetime" HeaderText="status_datetime" SortExpression="status_datetime" />
                <asp:BoundField DataField="Updated_on" HeaderText="Updated_on" SortExpression="Updated_on" />
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
        <p style="font-size: large; font-weight: bold; color: #000066">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select schedule.id,schedule.Node_Name, schedule.lea,schedule.platform,schedule.Type,schedule.Task,schedule.Priority,schedule.Start_Date,schedule.End_Date,schedule.status,schedule.status_datetime,schedule.Updated_on from schedule left join lea2 on schedule.lea=lea2.lea where schedule.Platform='Tower' and lea2.ntw_eng=@ntweng and month(Start_Date)=month(@start) and year(Start_Date)=year(@start) and status='close' and task=@task">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ntweng" QueryStringField="ntweng" />
                    <asp:QueryStringParameter Name="start" QueryStringField="start" />
                    <asp:QueryStringParameter Name="task" QueryStringField="task" />
                </SelectParameters>
            </asp:SqlDataSource>
    </p>
</asp:Content>
