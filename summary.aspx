<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="summary.aspx.cs" Inherits="Routine_Maintenance.summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <br />
<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text="Summary of IPNW"></asp:Label>
</p>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#003366" BorderColor="#E7E7FF" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="auto-style2" DataSourceID="SqlDataSource1" GridLines="Horizontal" Height="51px" Width="16px">
    <AlternatingRowStyle BackColor="#F7F7F7" />
    <Columns>
        <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
        <asp:BoundField DataField="NW/WPC-1" HeaderText="NW/WPC-1" SortExpression="NW/WPC-1" />
        <asp:BoundField DataField="NW/WPC-2" HeaderText="NW/WPC-2" SortExpression="NW/WPC-2" />
        <asp:BoundField DataField="NW/WPNE" HeaderText="NW/WPNE" SortExpression="NW/WPNE" />
        <asp:BoundField DataField="NW/WPSW" HeaderText="NW/WPSW" SortExpression="NW/WPSW" />
        <asp:BoundField DataField="NW/WPSE" HeaderText="NW/WPSE" SortExpression="NW/WPSE" />
        <asp:BoundField DataField="NW/WPE" HeaderText="NW/WPE" SortExpression="NW/WPE" />
        <asp:BoundField DataField="NW/WPN" HeaderText="NW/WPN" SortExpression="NW/WPN" />
        <asp:BoundField DataField="NW/NWPE" HeaderText="NW/NWPE" SortExpression="NW/NWPE" />
        <asp:BoundField DataField="NW/NWPW" HeaderText="NW/NWPW" SortExpression="NW/NWPW" />
        <asp:BoundField DataField="NW/CPN" HeaderText="NW/CPN" SortExpression="NW/CPN" />
        <asp:BoundField DataField="NW/CPS" HeaderText="NW/CPS" SortExpression="NW/CPS" />
        <asp:BoundField DataField="NW/NCP" HeaderText="NW/NCP" SortExpression="NW/NCP" />
        <asp:BoundField DataField="NW/UVA" HeaderText="NW/UVA" SortExpression="NW/UVA" />
        <asp:BoundField DataField="NW/SAB" HeaderText="NW/SAB" SortExpression="NW/SAB" />
        <asp:BoundField DataField="NW/SPE" HeaderText="NW/SPE" SortExpression="NW/SPE" />
        <asp:BoundField DataField="NW/SPW" HeaderText="NW/SPW" SortExpression="NW/SPW" />
        <asp:BoundField DataField="NW/WPS" HeaderText="NW/WPS" SortExpression="NW/WPS" />
        <asp:BoundField DataField="NW/EP" HeaderText="NW/EP" SortExpression="NW/EP" />
        <asp:BoundField DataField="NW/NP-1" HeaderText="NW/NP-1" SortExpression="NW/NP-1" />
        <asp:BoundField DataField="NW/NP-2" HeaderText="NW/NP-2" SortExpression="NW/NP-2" />
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
<p>
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text="Summary of SDH/SLBN"></asp:Label>
</p>
<p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
            <asp:BoundField DataField="NW/WPC-1" HeaderText="NW/WPC-1" ReadOnly="True" SortExpression="NW/WPC-1" />
            <asp:BoundField DataField="NW/WPC-2" HeaderText="NW/WPC-2" ReadOnly="True" SortExpression="NW/WPC-2" />
            <asp:BoundField DataField="NW/WPNE" HeaderText="NW/WPNE" ReadOnly="True" SortExpression="NW/WPNE" />
            <asp:BoundField DataField="NW/WPSW" HeaderText="NW/WPSW" ReadOnly="True" SortExpression="NW/WPSW" />
            <asp:BoundField DataField="NW/WPSE" HeaderText="NW/WPSE" ReadOnly="True" SortExpression="NW/WPSE" />
            <asp:BoundField DataField="NW/WPE" HeaderText="NW/WPE" ReadOnly="True" SortExpression="NW/WPE" />
            <asp:BoundField DataField="NW/WPN" HeaderText="NW/WPN" ReadOnly="True" SortExpression="NW/WPN" />
            <asp:BoundField DataField="NW/NWPE" HeaderText="NW/NWPE" ReadOnly="True" SortExpression="NW/NWPE" />
            <asp:BoundField DataField="NW/NWPW" HeaderText="NW/NWPW" ReadOnly="True" SortExpression="NW/NWPW" />
            <asp:BoundField DataField="NW/CPN" HeaderText="NW/CPN" ReadOnly="True" SortExpression="NW/CPN" />
            <asp:BoundField DataField="NW/CPS" HeaderText="NW/CPS" ReadOnly="True" SortExpression="NW/CPS" />
            <asp:BoundField DataField="NW/NCP" HeaderText="NW/NCP" ReadOnly="True" SortExpression="NW/NCP" />
            <asp:BoundField DataField="NW/UVA" HeaderText="NW/UVA" ReadOnly="True" SortExpression="NW/UVA" />
            <asp:BoundField DataField="NW/SAB" HeaderText="NW/SAB" ReadOnly="True" SortExpression="NW/SAB" />
            <asp:BoundField DataField="NW/SPE" HeaderText="NW/SPE" ReadOnly="True" SortExpression="NW/SPE" />
            <asp:BoundField DataField="NW/SPW" HeaderText="NW/SPW" ReadOnly="True" SortExpression="NW/SPW" />
            <asp:BoundField DataField="NW/WPS" HeaderText="NW/WPS" ReadOnly="True" SortExpression="NW/WPS" />
            <asp:BoundField DataField="NW/EP" HeaderText="NW/EP" ReadOnly="True" SortExpression="NW/EP" />
            <asp:BoundField DataField="NW/NP-1" HeaderText="NW/NP-1" ReadOnly="True" SortExpression="NW/NP-1" />
            <asp:BoundField DataField="NW/NP-2" HeaderText="NW/NP-2" ReadOnly="True" SortExpression="NW/NP-2" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT Month, [NW/WPC-1],[NW/WPC-2],[NW/WPNE],[NW/WPSW],[NW/WPSE],[NW/WPE],[NW/WPN],[NW/NWPE],[NW/NWPW],[NW/CPN],[NW/CPS],[NW/NCP],[NW/UVA],[NW/SAB],[NW/SPE],[NW/SPW],[NW/WPS],[NW/EP],[NW/NP-1],[NW/NP-2]
      FROM  
    (SELECT (status_datetime) as Month,lea2.designation,Schedule.status,Schedule.Task
FROM [PMS].[dbo].[Schedule] INNER JOIN lea2 ON Schedule.LEA=lea2.LEA 
WHERE Schedule.status='Close' and Platform='SLBN/SDH' and Start_Date &gt;=DATEFROMPARTS(YEAR(GETDATE()), 1, 1))
        AS tb  
    PIVOT  
    (  count(Task)
   
    FOR  
    designation 
        IN (  [NW/WPC-1],[NW/WPC-2],[NW/WPNE],[NW/WPSW],[NW/WPSE],[NW/WPE],[NW/WPN],[NW/NWPE],[NW/NWPW],[NW/CPN],[NW/CPS],[NW/NCP],[NW/UVA],[NW/SAB],[NW/SPE],[NW/SPW],[NW/WPS],[NW/EP],[NW/NP-1],[NW/NP-2])) as ptb 

		 
ORDER BY
    CASE Month
       
      when 'January' then 0 
	  when 'February' then 1
	  WHEN 'March' THEN 2
        WHEN 'April' THEN 3
        WHEN 'May' THEN 4
        WHEN 'June' THEN 5
        WHEN 'July' THEN 6
        WHEN 'August' THEN 7
        WHEN 'September' THEN 8
        WHEN 'October' THEN 9
        WHEN 'November' THEN 10
        WHEN 'December' THEN 11
	  else 1 end asc ;
    "></asp:SqlDataSource>
</p>
<p>
    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text="Summary of MSAN"></asp:Label>
</p>
<p>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
            <asp:BoundField DataField="NW/WPC-1" HeaderText="NW/WPC-1" ReadOnly="True" SortExpression="NW/WPC-1" />
            <asp:BoundField DataField="NW/WPC-2" HeaderText="NW/WPC-2" ReadOnly="True" SortExpression="NW/WPC-2" />
            <asp:BoundField DataField="NW/WPNE" HeaderText="NW/WPNE" ReadOnly="True" SortExpression="NW/WPNE" />
            <asp:BoundField DataField="NW/WPSW" HeaderText="NW/WPSW" ReadOnly="True" SortExpression="NW/WPSW" />
            <asp:BoundField DataField="NW/WPSE" HeaderText="NW/WPSE" ReadOnly="True" SortExpression="NW/WPSE" />
            <asp:BoundField DataField="NW/WPE" HeaderText="NW/WPE" ReadOnly="True" SortExpression="NW/WPE" />
            <asp:BoundField DataField="NW/WPN" HeaderText="NW/WPN" ReadOnly="True" SortExpression="NW/WPN" />
            <asp:BoundField DataField="NW/NWPE" HeaderText="NW/NWPE" ReadOnly="True" SortExpression="NW/NWPE" />
            <asp:BoundField DataField="NW/NWPW" HeaderText="NW/NWPW" ReadOnly="True" SortExpression="NW/NWPW" />
            <asp:BoundField DataField="NW/CPN" HeaderText="NW/CPN" ReadOnly="True" SortExpression="NW/CPN" />
            <asp:BoundField DataField="NW/CPS" HeaderText="NW/CPS" ReadOnly="True" SortExpression="NW/CPS" />
            <asp:BoundField DataField="NW/NCP" HeaderText="NW/NCP" ReadOnly="True" SortExpression="NW/NCP" />
            <asp:BoundField DataField="NW/UVA" HeaderText="NW/UVA" ReadOnly="True" SortExpression="NW/UVA" />
            <asp:BoundField DataField="NW/SAB" HeaderText="NW/SAB" ReadOnly="True" SortExpression="NW/SAB" />
            <asp:BoundField DataField="NW/SPE" HeaderText="NW/SPE" ReadOnly="True" SortExpression="NW/SPE" />
            <asp:BoundField DataField="NW/SPW" HeaderText="NW/SPW" ReadOnly="True" SortExpression="NW/SPW" />
            <asp:BoundField DataField="NW/WPS" HeaderText="NW/WPS" ReadOnly="True" SortExpression="NW/WPS" />
            <asp:BoundField DataField="NW/EP" HeaderText="NW/EP" ReadOnly="True" SortExpression="NW/EP" />
            <asp:BoundField DataField="NW/NP-1" HeaderText="NW/NP-1" ReadOnly="True" SortExpression="NW/NP-1" />
            <asp:BoundField DataField="NW/NP-2" HeaderText="NW/NP-2" ReadOnly="True" SortExpression="NW/NP-2" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT Month, [NW/WPC-1],[NW/WPC-2],[NW/WPNE],[NW/WPSW],[NW/WPSE],[NW/WPE],[NW/WPN],[NW/NWPE],[NW/NWPW],[NW/CPN],[NW/CPS],[NW/NCP],[NW/UVA],[NW/SAB],[NW/SPE],[NW/SPW],[NW/WPS],[NW/EP],[NW/NP-1],[NW/NP-2]
      FROM  
    (SELECT (status_datetime) as Month,lea2.designation,Schedule.status,Schedule.Task
FROM [PMS].[dbo].[Schedule] INNER JOIN lea2 ON Schedule.LEA=lea2.LEA 
WHERE Schedule.status='Close' and Platform='MSAN' and Start_Date &gt;=DATEFROMPARTS(YEAR(GETDATE()), 1, 1))
        AS tb  
    PIVOT  
    (  count(Task)
   
    FOR  
    designation 
        IN (  [NW/WPC-1],[NW/WPC-2],[NW/WPNE],[NW/WPSW],[NW/WPSE],[NW/WPE],[NW/WPN],[NW/NWPE],[NW/NWPW],[NW/CPN],[NW/CPS],[NW/NCP],[NW/UVA],[NW/SAB],[NW/SPE],[NW/SPW],[NW/WPS],[NW/EP],[NW/NP-1],[NW/NP-2])) as ptb 

		 
ORDER BY
    CASE Month
       
      when 'January' then 0 
	  when 'February' then 1
	  WHEN 'March' THEN 2
        WHEN 'April' THEN 3
        WHEN 'May' THEN 4
        WHEN 'June' THEN 5
        WHEN 'July' THEN 6
        WHEN 'August' THEN 7
        WHEN 'September' THEN 8
        WHEN 'October' THEN 9
        WHEN 'November' THEN 10
        WHEN 'December' THEN 11
	  else 1 end asc ;
    "></asp:SqlDataSource>
</p>
<p>
    &nbsp;</p>

    <p>
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#000066" Text="Summary of Tower Maintenance"></asp:Label>
</p>
<p>
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource5" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
            <asp:BoundField DataField="NW/WPC-1" HeaderText="NW/WPC-1" ReadOnly="True" SortExpression="NW/WPC-1" />
            <asp:BoundField DataField="NW/WPC-2" HeaderText="NW/WPC-2" ReadOnly="True" SortExpression="NW/WPC-2" />
            <asp:BoundField DataField="NW/WPNE" HeaderText="NW/WPNE" ReadOnly="True" SortExpression="NW/WPNE" />
            <asp:BoundField DataField="NW/WPSW" HeaderText="NW/WPSW" ReadOnly="True" SortExpression="NW/WPSW" />
            <asp:BoundField DataField="NW/WPSE" HeaderText="NW/WPSE" ReadOnly="True" SortExpression="NW/WPSE" />
            <asp:BoundField DataField="NW/WPE" HeaderText="NW/WPE" ReadOnly="True" SortExpression="NW/WPE" />
            <asp:BoundField DataField="NW/WPN" HeaderText="NW/WPN" ReadOnly="True" SortExpression="NW/WPN" />
            <asp:BoundField DataField="NW/NWPE" HeaderText="NW/NWPE" ReadOnly="True" SortExpression="NW/NWPE" />
            <asp:BoundField DataField="NW/NWPW" HeaderText="NW/NWPW" ReadOnly="True" SortExpression="NW/NWPW" />
            <asp:BoundField DataField="NW/CPN" HeaderText="NW/CPN" ReadOnly="True" SortExpression="NW/CPN" />
            <asp:BoundField DataField="NW/CPS" HeaderText="NW/CPS" ReadOnly="True" SortExpression="NW/CPS" />
            <asp:BoundField DataField="NW/NCP" HeaderText="NW/NCP" ReadOnly="True" SortExpression="NW/NCP" />
            <asp:BoundField DataField="NW/UVA" HeaderText="NW/UVA" ReadOnly="True" SortExpression="NW/UVA" />
            <asp:BoundField DataField="NW/SAB" HeaderText="NW/SAB" ReadOnly="True" SortExpression="NW/SAB" />
            <asp:BoundField DataField="NW/SPE" HeaderText="NW/SPE" ReadOnly="True" SortExpression="NW/SPE" />
            <asp:BoundField DataField="NW/SPW" HeaderText="NW/SPW" ReadOnly="True" SortExpression="NW/SPW" />
            <asp:BoundField DataField="NW/WPS" HeaderText="NW/WPS" ReadOnly="True" SortExpression="NW/WPS" />
            <asp:BoundField DataField="NW/EP" HeaderText="NW/EP" ReadOnly="True" SortExpression="NW/EP" />
            <asp:BoundField DataField="NW/NP-1" HeaderText="NW/NP-1" ReadOnly="True" SortExpression="NW/NP-1" />
            <asp:BoundField DataField="NW/NP-2" HeaderText="NW/NP-2" ReadOnly="True" SortExpression="NW/NP-2" />
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
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" 
        SelectCommand="SELECT Month, [NW/WPC-1],[NW/WPC-2],[NW/WPNE],[NW/WPSW],[NW/WPSE],[NW/WPE],[NW/WPN],[NW/NWPE],[NW/NWPW],[NW/CPN],[NW/CPS],[NW/NCP],[NW/UVA],[NW/SAB],[NW/SPE],[NW/SPW],[NW/WPS],[NW/EP],[NW/NP-1],[NW/NP-2]
      FROM  
    (SELECT (status_datetime) as Month,lea2.designation,Schedule.status,Schedule.Task
FROM [PMS].[dbo].[Schedule] INNER JOIN lea2 ON Schedule.LEA=lea2.LEA 
WHERE Schedule.status='Close' and Platform='tower' and Start_Date &gt;=DATEFROMPARTS(YEAR(GETDATE()), 1, 1))
        AS tb  
    PIVOT  
    (  count(Task)
   
    FOR  
    designation 
        IN (  [NW/WPC-1],[NW/WPC-2],[NW/WPNE],[NW/WPSW],[NW/WPSE],[NW/WPE],[NW/WPN],[NW/NWPE],[NW/NWPW],[NW/CPN],[NW/CPS],[NW/NCP],[NW/UVA],[NW/SAB],[NW/SPE],[NW/SPW],[NW/WPS],[NW/EP],[NW/NP-1],[NW/NP-2])) as ptb 

		 
ORDER BY
    CASE Month
       
      when 'January' then 0 
	  when 'February' then 1
	  WHEN 'March' THEN 2
        WHEN 'April' THEN 3
        WHEN 'May' THEN 4
        WHEN 'June' THEN 5
        WHEN 'July' THEN 6
        WHEN 'August' THEN 7
        WHEN 'September' THEN 8
        WHEN 'October' THEN 9
        WHEN 'November' THEN 10
        WHEN 'December' THEN 11
	  else 1 end asc ;
    "></asp:SqlDataSource>
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT Month, [NW/WPC-1],[NW/WPC-2],[NW/WPNE],[NW/WPSW],[NW/WPSE],[NW/WPE],[NW/WPN],[NW/NWPE],[NW/NWPW],[NW/CPN],[NW/CPS],[NW/NCP],[NW/UVA],[NW/SAB],[NW/SPE],[NW/SPW],[NW/WPS],[NW/EP],[NW/NP-1],[NW/NP-2]
      FROM  
    (SELECT (status_datetime) as Month,lea2.designation,Schedule.status,Schedule.Task
FROM [PMS].[dbo].[Schedule] INNER JOIN lea2 ON Schedule.LEA=lea2.LEA 
WHERE Schedule.status='Close' and Platform='IPNW' and Start_Date &gt;=DATEFROMPARTS(YEAR(GETDATE()), 1, 1))
        AS tb  
    PIVOT  
    (  count(Task)
   
    FOR  
    designation 
        IN (  [NW/WPC-1],[NW/WPC-2],[NW/WPNE],[NW/WPSW],[NW/WPSE],[NW/WPE],[NW/WPN],[NW/NWPE],[NW/NWPW],[NW/CPN],[NW/CPS],[NW/NCP],[NW/UVA],[NW/SAB],[NW/SPE],[NW/SPW],[NW/WPS],[NW/EP],[NW/NP-1],[NW/NP-2])) as ptb 

		 
ORDER BY
    CASE Month
       
      when 'January' then 0 
	  when 'February' then 1
	  WHEN 'March' THEN 2
        WHEN 'April' THEN 3
        WHEN 'May' THEN 4
        WHEN 'June' THEN 5
        WHEN 'July' THEN 6
        WHEN 'August' THEN 7
        WHEN 'September' THEN 8
        WHEN 'October' THEN 9
        WHEN 'November' THEN 10
        WHEN 'December' THEN 11
	  else 1 end asc ;
    
    
"></asp:SqlDataSource>
</p>
</asp:Content>
