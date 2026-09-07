<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="Routine_Maintenance.schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">



        *{box-sizing:border-box}
        
        *{text-shadow:none!important;box-shadow:none!important}


        .auto-style14 {
        width: 1014px;
            height: 12px;
        margin-bottom: 0px;
    }
        .auto-style42 {
        font-size: small;
        color: #000000;
        font-weight: normal;
        height: 24px;
        width: 114px;
    }
    .auto-style43 {
        width: 263px;
        height: 24px;
    }
    .auto-style44 {
        height: 24px;
        width: 463px;
    }
    .auto-style48 {
        font-size: small;
        color: #000099;
        font-weight: normal;
        height: 30px;
        width: 114px;
    }
    .auto-style49 {
        width: 263px;
        height: 30px;
    }
    .auto-style50 {
        height: 30px;
        width: 463px;
    }
    .auto-style51 {
        font-size: small;
        color: #000000;
        font-weight: normal;
        width: 114px;
    }
    .auto-style52 {
        width: 263px;
    }
    .auto-style53 {
        width: 463px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="font-size: large; font-weight: bold; color: #003366;">
    Task Scheduling</p>
    <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style42" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Platform</td>
            <td class="auto-style43" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" Height="23px" Width="179px">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>IPNW</asp:ListItem>
                    <asp:ListItem>MSAN</asp:ListItem>
                    <asp:ListItem>SLBN/SDH</asp:ListItem>
                    <asp:ListItem>ITMC</asp:ListItem>
                    <asp:ListItem>Tower</asp:ListItem>
                    </asp:DropDownList>
            </td>
            <td class="auto-style44" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
            </td>
        </tr>
        <tr>
            <td class="auto-style51" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Task</td>
            <td class="auto-style52" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" ViewStateMode="Enabled" Width="179px" DataSourceID="SqlDataSource1" DataTextField="task" DataValueField="task">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select task from platform where platform=@platform">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList4" DefaultValue="select" Name="platform" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style53" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
            </td>
        </tr>
        <tr>
            <td class="auto-style48" spellcheck="True">Priority</td>
            <td class="auto-style49" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList5" runat="server" Height="21px" Width="179px">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>High</asp:ListItem>
                    <asp:ListItem>Medium</asp:ListItem>
                    <asp:ListItem>Low</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style50" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style48" spellcheck="True">Start Date</td>
            <td class="auto-style49" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:TextBox ID="TextBox1" runat="server" style="height: 22px" Width="179px"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="26px" />
                <br />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" VisibleDate="2024-03-22" Width="220px">
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
            <td class="auto-style50" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style48" spellcheck="True">End Date</td>
            <td class="auto-style49" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:TextBox ID="TextBox2" runat="server" style="height: 22px" Width="179px"></asp:TextBox>
                <asp:ImageButton ID="ImageButton2" runat="server" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton2_Click" Width="26px" />
                <br />
                <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar2_SelectionChanged" Visible="False" VisibleDate="2024-03-22" Width="220px">
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
            <td class="auto-style50" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style48" spellcheck="True">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            </td>
            <td class="auto-style49" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                &nbsp;</td>
            <td class="auto-style50" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style48" spellcheck="True">&nbsp;</td>
            <td class="auto-style49" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                &nbsp;</td>
            <td class="auto-style50" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                &nbsp;</td>
        </tr>
    </table>
    </asp:Content>
