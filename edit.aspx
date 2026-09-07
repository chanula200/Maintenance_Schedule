<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="Routine_Maintenance.edit" %>
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
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
                <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="status_datetime" HeaderText="status_datetime" SortExpression="status_datetime" />
                <asp:BoundField DataField="Updated_on" HeaderText="Updated_on" SortExpression="Updated_on" />
                <asp:BoundField DataField="updated_by" HeaderText="updated_by" SortExpression="updated_by" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </p>
    <p>
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                <asp:BoundField DataField="platform" HeaderText="platform" SortExpression="platform" />
                <asp:BoundField DataField="maintenance_task" HeaderText="maintenance_task" SortExpression="maintenance_task" />
                <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
                <asp:BoundField DataField="completed_on" HeaderText="completed_on" SortExpression="completed_on" />
                <asp:CommandField ShowEditButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select formdata.ID,formdata.Node_Name,formdata.platform,formdata.maintenance_task,Frequency,formdata.Status,formdata.Remark,formdata.completed_on from formdata left join taskdetails on formdata.Maintenance_Task=Taskdetails.Maintenance_Item where Node_Name=@Node_Name and End_Date=@End_Date and formdata.platform=@platform;
" UpdateCommand="update formdata set status=@status, Remark=@Remark,Completed_on=@Completed_on where ID=@ID;">
            <SelectParameters>
                <asp:QueryStringParameter Name="Node_Name" QueryStringField="Node_Name" />
                <asp:QueryStringParameter Name="End_Date" QueryStringField="End_Date" />
                <asp:QueryStringParameter Name="platform" QueryStringField="platform" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="status" />
                <asp:Parameter Name="Remark" />
                <asp:Parameter Name="Completed_on" />
                <asp:Parameter Name="ID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="Select id,Node_Name,Platform,Type,Start_Date,End_Date,Status,status_datetime,Updated_on,updated_by from schedule where Node_Name=@Node_Name and PLATFORM=@platform and End_Date=@End_Date
" UpdateCommand="UPDATE Schedule SET status_datetime = @status_datetime, status = @status, Updated_on = SYSDATETIME(), updated_by = @serviceno WHERE (ID = @ID);">
            <SelectParameters>
                <asp:QueryStringParameter Name="Node_Name" QueryStringField="Node_Name" />
                <asp:QueryStringParameter Name="platform" QueryStringField="Platform" />
                <asp:QueryStringParameter Name="End_Date" QueryStringField="End_Date" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="status_datetime" />
                <asp:Parameter Name="status" />
                <asp:Parameter Name="serviceno" />
                <asp:Parameter Name="ID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
