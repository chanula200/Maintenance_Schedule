<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="report7.aspx.cs" Inherits="Routine_Maintenance.report7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        
                
        *{text-shadow:none!important;box-shadow:none!important}


        
                
        *{box-sizing:border-box}
        
                
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
</p>
<p>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Size="Small" Height="16px" Width="452px">
        <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
            <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
            <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Updated_on" HeaderText="Updated_on" SortExpression="Updated_on" />
            <asp:BoundField DataField="updated_by" HeaderText="updated_by" SortExpression="updated_by" />
        </Fields>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
    </asp:DetailsView>
</p>
<p>
    &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Maintenance_Type" HeaderText="Maintenance_Type" SortExpression="Maintenance_Type" />
            <asp:BoundField DataField="Maintenance_Task" HeaderText="Maintenance_Task" SortExpression="Maintenance_Task" />
            <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
        </Columns>
    </asp:GridView>
</p>
<p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="condition" HeaderText="condition" SortExpression="condition" />
            <asp:BoundField DataField="tower_section" HeaderText="tower_section" SortExpression="tower_section" />
            <asp:BoundField DataField="leg" HeaderText="leg" SortExpression="leg" />
            <asp:BoundField DataField="observation" HeaderText="observation" SortExpression="observation" />
            <asp:BoundField DataField="Completed_on" HeaderText="Completed_on" SortExpression="Completed_on" />
            <asp:BoundField DataField="Updated_on" HeaderText="Updated_on" SortExpression="Updated_on" />
            <asp:BoundField DataField="Updated_by" HeaderText="Updated_by" SortExpression="Updated_by" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT Type,condition,tower_section,leg,observation,Completed_on,Updated_on,Updated_by FROM [PMS].[dbo].[temptwmtc] where Node_Name=@node_name and End_Date=@End_Date ;">
        <SelectParameters>
            <asp:QueryStringParameter Name="node_name" QueryStringField="Node_name" />
            <asp:QueryStringParameter DefaultValue="" Name="End_Date" QueryStringField="End_date" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select formdatatm.ID,Maintenance_Type,Maintenance_Task,Frequency,Status,Remark from formdatatm left join Taskdetails on formdatatm.Maintenance_Task=Taskdetails.Maintenance_Item where Node_Name=@Node_Name and formdatatm.platform=@platform and End_Date=@End_Date order by ID
">
        <SelectParameters>
            <asp:QueryStringParameter Name="Node_Name" QueryStringField="Node_Name" />
            <asp:QueryStringParameter Name="platform" QueryStringField="platform" />
            <asp:QueryStringParameter Name="End_Date" QueryStringField="End_Date" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="Select Node_Name,Platform,Type,Start_Date,End_Date,Status,Updated_on,updated_by from schedule where Node_Name=@Node_Name and PLATFORM=@platform and End_Date=@End_Date
">
        <SelectParameters>
            <asp:QueryStringParameter Name="Node_Name" QueryStringField="Node_Name" />
            <asp:QueryStringParameter Name="platform" QueryStringField="Platform" />
            <asp:QueryStringParameter Name="End_Date" QueryStringField="End_Date" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>
