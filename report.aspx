<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="Routine_Maintenance.report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 512px;
    }
    .auto-style3 {
        width: 512px;
        height: 29px;
    }
    .auto-style9 {
        width: 8px;
        height: 29px;
    }
    .auto-style13 {
        width: 8px;
    }
    

        *{box-sizing:border-box}
        
        *{text-shadow:none!important;box-shadow:none!important}


        .auto-style43 {
            width: 132px;
            height: 29px;
        }
        .auto-style44 {
            width: 132px;
        }
    

        .auto-style45 {
            width: 313px;
        }
        .auto-style46 {
            width: 88px;
        }
    

        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <table class="style1">
     <tr>
            <td class="auto-style9"></td>
            <td class="auto-style43"></td>
            <td class="auto-style3" colspan="3"></td>
        </tr>
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style44">Network Engineer:&nbsp; </td>
            <td class="auto-style2" colspan="3"><span class="style14"><asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" Height="27px" Width="210px" AutoPostBack="True" DataTextField="ntw_eng" DataValueField="ntw_eng">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select distinct lea2.ntw_eng from schedule left join lea2 on schedule.lea=lea2.lea order by ntw_eng;"></asp:SqlDataSource>
                </span></td>
        </tr>
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style44">Platform:</td>
            <td class="auto-style2" colspan="3">
                <span class="style14"><asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" Height="27px" Width="210px" AutoPostBack="True" DataTextField="platform" DataValueField="platform">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select distinct platform from schedule left join lea2 on schedule.lea=lea2.lea where Ntw_eng=@ntw_eng order by Platform">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="ntw_eng" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </span>
            </td>
        </tr>
   <tr>
            <td class="auto-style13" valign="top"></td>
            <td class="auto-style11" valign="top">Node:</td>
            <td class="auto-style2" colspan="3">
                <span class="style14"><asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="Node_Name" DataValueField="Node_Name" Height="27px" Width="210px" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select Node_Name from schedule left join lea2 on schedule.lea=lea2.lea where Platform=@platform and Ntw_eng=@ntw_eng order by Node_Name">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="platform" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="ntw_eng" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </span>
            </td>
        </tr>
           <%--  <tr>
            <td class="auto-style13" valign="top"></td>
            <td class="auto-style11" valign="top">From:</td>
            <td class="auto-style14">
                <asp:TextBox ID="TextBox1" runat="server" Width="155px"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="26px" />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
            <td class="auto-style15">
                To:</td>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox2" runat="server" Width="155px"></asp:TextBox>
        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton2_Click" Width="26px" />
                <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar2_SelectionChanged" Width="220px">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="auto-style13" valign="top">&nbsp;</td>
            <td class="auto-style11" valign="top">&nbsp;</td>
            <td class="auto-style14">
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            </td>
            <td class="auto-style15">
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>--%>
   <tr>
            <td class="auto-style13" valign="top">&nbsp;</td>
            <td class="auto-style11" valign="top">From:</td>
            <td class="auto-style45">
        <asp:TextBox ID="TextBox2" runat="server" Width="128px"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="26px" />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged1" Visible="False">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
            <td class="auto-style46">
                To:</td>
            <td class="auto-style2">
        <asp:TextBox ID="TextBox3" runat="server" Width="128px"></asp:TextBox>
        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton2_Click" Width="26px" />
                <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="Calendar2_SelectionChanged1" Visible="False">
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>
            </td>
        </tr>
           </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource4">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
            <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:TemplateField HeaderText="Node_Name" SortExpression="Node_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Node_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "reportdownload.aspx?Node_Name=" + Eval("Node_Name") + "&Platform=" + Eval("Platform") + "&End_Date=" + Eval("End_Date") %>' Text='<%# Bind("Node_Name") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="priority" HeaderText="priority" SortExpression="priority" />
            <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
            <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
            <asp:BoundField DataField="Completed_On" HeaderText="Completed_On" SortExpression="Completed_On" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />

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
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="GetreportDetails" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList4" Name="Node" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList3" Name="platform" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="ntw_Eng" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TextBox2" Name="fromdate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="TextBox3" Name="todate" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
<br />

</asp:Content>
