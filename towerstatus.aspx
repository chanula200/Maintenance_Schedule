<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="towerstatus.aspx.cs" Inherits="Routine_Maintenance.towerstatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        
        *{text-shadow:none!important;box-shadow:none!important}


        *{box-sizing:border-box}
        
        .auto-style2 {
            margin-right: 0px;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="font-size: x-large; font-weight: bold; color: #000066">
        Tower Maintenance Dashboard</p>
    <p>
        Time Period:
        <asp:TextBox ID="TextBox2" runat="server" Width="128px"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="26px" />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Width="220px" Visible="False" VisibleDate="2024-03-20">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
    </p>
    <p style="font-size: large; font-weight: bold; color: #000066">
        Overall Tower Satatus</p>
    <p style="font-size: large; font-weight: bold; color: #000066">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" CssClass="auto-style2">
            <Columns>
                <asp:TemplateField HeaderText="Good" SortExpression="Good">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Good") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Navigate" Text='<%# Bind("Good") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Moderate" SortExpression="Moderate">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Moderate") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Navigate1" Text='<%# Bind("Moderate") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bad" SortExpression="Bad">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Bad") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Navigate2" Text='<%# Bind("Bad") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT *
FROM (
SELECT Status, COUNT(Status) AS StatusCount
    FROM [PMS].[dbo].[formdata]
    WHERE Maintenance_Task = 'Overall condition of the tower' AND platform = 'Tower'
 and month(Completed_on)=month('2025-03-14') and End_Date&gt;='2025-01-01' GROUP BY Status
) AS SourceData
PIVOT (
SUM(StatusCount)
    FOR Status IN (Good,Moderate,Bad
)) AS PivotTable;
">
        </asp:SqlDataSource>
    </p>
    <p style="font-size: large; font-weight: bold; color: #000066">
        Region wise Performance</p>
    <p style="font-size: large; font-weight: bold; color: #000066">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" OnRowCommand="GridView2_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="ntw_eng" SortExpression="ntw_eng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ntw_eng") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Navigate3" Text='<%# Eval("ntw_eng") %>' CommandArgument='<%# Eval("ntw_eng") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Closed" HeaderText="Closed" ReadOnly="True" SortExpression="Closed" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="
SELECT ntw_eng, 
     
 SUM(CASE WHEN status = 'close' THEN 1 ELSE 0 END) AS Closed FROM schedule left join lea2 on lea2.lea=schedule.lea where Platform='Tower' and schedule.Task!='Tower Maintenance' and status_datetime=DATENAME(mm, @period) group by ntw_eng">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="Period" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p style="font-size: large; font-weight: bold; color: #000066">
        &nbsp;</p>
</asp:Content>
