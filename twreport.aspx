<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="twreport.aspx.cs" Inherits="Routine_Maintenance.twreport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    .auto-style3 {
        height: 26px;
    }
    .auto-style4 {
        width: 72px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
    Maintenance type:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="23px" Width="130px">
        <asp:ListItem>Select</asp:ListItem>
        <asp:ListItem>Region</asp:ListItem>
        <asp:ListItem>HQ</asp:ListItem>
    </asp:DropDownList>
</p>
<asp:Panel ID="Panel2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#003366" Visible="False">
    &nbsp;Tower Report Based on All Sections of the Tower<br />
    <table class="style1">
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style4" style="font-size: small; font-weight: normal; color: #003399">Task Type</td>
            <td class="auto-style3">
                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" datasourceid="SqlDataSource4" DataTextField="Maintenance_Type" DataValueField="Maintenance_Type" Height="32px" Width="734px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select '~select~'  as maintenance_type union SELECT distinct Maintenance_Type
  FROM [PMS].[dbo].[Taskdetails] where frequency='Annually' and platform='Tower'"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style4" style="font-size: small; font-weight: normal; color: #003399">Task</td>
            <td class="auto-style3">
                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" datasourceid="SqlDataSource5" DataTextField="Maintenance_Item" DataValueField="Maintenance_Item" Height="32px" Width="734px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select '~select~'  as maintenance_item union SELECT Maintenance_Item
  FROM [PMS].[dbo].[Taskdetails] where frequency='Annually' and platform='Tower' and Maintenance_Type=@Maintenance_Type">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList4" Name="Maintenance_Type" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource3" Font-Bold="False" Font-Size="Small" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="Completed_Year" HeaderText="Completed_Year" ReadOnly="True" SortExpression="Completed_Year" />
            <asp:BoundField DataField="Completed_Month" HeaderText="Completed_Month" ReadOnly="True" SortExpression="Completed_Month" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Node_Count" HeaderText="Node_Count" ReadOnly="True" SortExpression="Node_Count" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT 
 
    DATEPART(YEAR, Completed_on) AS Completed_Year,
    DATEPART(MONTH, Completed_on) AS Completed_Month,
    [Status],
    COUNT([ID]) AS Node_Count
FROM 
    [PMS].[dbo].[formdatatm] where  [Maintenance_Task]=@Maintenance_Task 
GROUP BY 
   
    DATEPART(YEAR, Completed_on),
    DATEPART(MONTH, Completed_on),
    [Status]
ORDER BY 
   
    Completed_Year,
    Completed_Month;
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList5" Name="Maintenance_Task" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Panel>
<asp:Panel ID="Panel1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#003399" Visible="False">
    Regional Tower Report<br />
    <table class="style1">
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style4" style="font-size: small; font-weight: normal; color: #003399">Task Type</td>
            <td class="auto-style3">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Maintenance_Type" DataValueField="Maintenance_Type" Height="32px" Width="734px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select '~select~'  as maintenance_type union SELECT distinct Maintenance_Type
  FROM [PMS].[dbo].[Taskdetails] where frequency='Monthly' and platform='Tower'"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style4" style="font-size: small; font-weight: normal; color: #003399">Task</td>
            <td class="auto-style3">
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Maintenance_Item" DataValueField="Maintenance_Item" Height="32px" Width="734px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select '~select~'  as maintenance_item union SELECT Maintenance_Item 
  FROM [PMS].[dbo].[Taskdetails] where frequency='Monthly' and platform='Tower' and Maintenance_Type=@Maintenance_Type">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Maintenance_Type" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource6" Font-Bold="False" Font-Size="Small" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="Completed_Year" HeaderText="Completed_Year" ReadOnly="True" SortExpression="Completed_Year" />
            <asp:BoundField DataField="Completed_Month" HeaderText="Completed_Month" ReadOnly="True" SortExpression="Completed_Month" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="Node_Count" HeaderText="Node_Count" ReadOnly="True" SortExpression="Node_Count" />
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
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="  SELECT 
    YEAR([Completed_on]) AS Completed_Year,
    MONTH([Completed_on]) AS Completed_Month,
    [Status],
    COUNT(Distinct Node_Name) AS Node_Count
FROM 
    [PMS].[dbo].[formdata]
WHERE 
    [Maintenance_Task] = @Maintenance_Task -- Replace 'YourMaintenanceTask' with the desired task
GROUP BY 
     YEAR([Completed_on]), MONTH([Completed_on]), [Status]
ORDER BY 
    YEAR([Completed_on]), MONTH([Completed_on]), [Status];
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList3" Name="Maintenance_Task" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Panel>
</asp:Content>
