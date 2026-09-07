<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ipnwdb.aspx.cs" Inherits="Routine_Maintenance.ipnwdb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        
        *{text-shadow:none!important;box-shadow:none!important}


        *{box-sizing:border-box}
        
        .auto-style2 {
            width: 328px;
        }
        .auto-style3 {
            width: 330px;
        }
        .auto-style4 {
            width: 345px;
        }
        .auto-style5 {
            width: 1503px;
        }
        
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <asp:Menu ID="NavigationMenu2" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal" Width="100%">
        <Items>
            <asp:MenuItem Text="MSAN" Value="towermtcform" NavigateUrl="~/pwdb.aspx"></asp:MenuItem>
            <asp:MenuItem Text="IPNW" Value="Surface_Condition" NavigateUrl="~/ipnwdb.aspx"></asp:MenuItem>
            <asp:MenuItem Text="SLBN/SDH" Value="Antenna" NavigateUrl="~/slbndb.aspx"></asp:MenuItem>
            <asp:MenuItem Text="ITMC" Value="Antenna" NavigateUrl="~/itmcdb.aspx"></asp:MenuItem>
           
            <asp:MenuItem Text="Tower Regional" Value="Antenna" NavigateUrl="~/towerdb2.aspx"></asp:MenuItem>
             <asp:MenuItem Text="Annual Tower Maintenance" Value="Antenna" NavigateUrl="~/towerdb3.aspx"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style5" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Schedule Start Date:
                <asp:TextBox ID="TextBox2" runat="server" Width="128px"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="26px" />
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300" Text="Label" Visible="False"></asp:Label>
            </td>
            <td class="auto-style7" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">&nbsp;</td>
            <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal;">
                <br /></td>
            <td class="auto-style2" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">
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
            </td>
            <td class="auto-style8" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">&nbsp;</td>
            <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal;">&nbsp;</td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp;</td>
        </tr>
    </table>
    <p style="font-size: large; font-weight: bold; color: #000066">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" OnRowCommand="GridView2_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="ntw_eng" SortExpression="ntw_eng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ntw_eng") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("ntw_eng") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pending" SortExpression="Pending">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pending") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Navigate4" Text='<%# Eval("Pending") %>' CommandArgument='<%#Eval("ntw_eng")%>'>LinkButton</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Closed" SortExpression="Closed">
                    <EditItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Closed") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Navigate3" Text='<%# Eval("Closed") %>' CommandArgument='<%#Eval("ntw_eng")%>'>LinkButton</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
       SUM(CASE WHEN status = 'pending' THEN 1 ELSE 0 END) AS Pending,
 SUM(CASE WHEN status = 'close' THEN 1 ELSE 0 END) AS Closed FROM schedule left join lea2 on lea2.lea=schedule.lea where Platform='IPNW' and month(Start_Date)=month(@start)  and year(Start_Date)=year(@start)  group by ntw_eng
">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="start" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p style="font-size: large; font-weight: bold; color: #000066">
        &nbsp;</p>
    <p>
    </p>
</asp:Content>
