<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="deleteNode.aspx.cs" Inherits="Routine_Maintenance.deleteNode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
        <br />
        Node Name :
        <asp:TextBox ID="TextBox1" runat="server" Width="296px"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Delete" Visible="False" />
&nbsp;
        <asp:Label ID="Label2" runat="server" ForeColor="#FF3300" Text="Label"></asp:Label>
    </p>
    <p>
        Platform:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="platform" DataValueField="platform" Height="31px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="233px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT '~select~' AS platform UNION SELECT DISTINCT platform FROM node;
"></asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="region" HeaderText="region" SortExpression="region" />
                <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" />
                <asp:BoundField DataField="Rtom" HeaderText="Rtom" SortExpression="Rtom" />
                <asp:BoundField DataField="LEA" HeaderText="LEA" SortExpression="LEA" />
                <asp:BoundField DataField="Node_name" HeaderText="Node_name" SortExpression="Node_name" />
                <asp:BoundField DataField="platform" HeaderText="platform" SortExpression="platform" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="ntw_eng" HeaderText="ntw_eng" SortExpression="ntw_eng" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select region,Province,Rtom,node.LEA, Node_name,platform,type,ntw_eng from node left join lea2 on node.lea=lea2.lea where node_name=@Node_Name and platform=@platform;">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Node_Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="platform" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                <asp:BoundField DataField="LEA" HeaderText="LEA" SortExpression="LEA" />
                <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
                <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
                <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT Node_Name,LEA,Platform,Type,Task,Priority,Start_Date,End_Date,status FROM [PMS].[dbo].[Schedule] where status!='Close' and End_Date&gt;=SYSDATETIME() and Node_Name=@Node_Name and platform=@platform;">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="Node_Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList1" Name="platform" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
