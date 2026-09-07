<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="slbnform.aspx.cs" Inherits="Routine_Maintenance.slbnform" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

label{display:inline-block;margin-bottom:.5rem}*{box-sizing:border-box}
        *{text-shadow:none!important;box-shadow:none!important}


        .auto-style14 {
        width: 1014px;
            height: 187px;
        }
        .auto-style27 {
            font-size: small;
            color: #000000;
            font-weight: normal;
            height: 29px;
            width: 305px;
        }
        .auto-style30 {
            width: 185px;
            height: 29px;
        }
        .auto-style41 {
            height: 29px;
            width: 463px;
        }
        .auto-style24 {
            width: 917px;
            height: 65px;
        }
        .auto-style32 {
            font-size: small;
            color: #000000;
            font-weight: normal;
            height: 29px;
            width: 304px;
        }
        .auto-style21 {
            width: 187px;
            height: 29px;
        }
        .auto-style40 {
            height: 29px;
            width: 469px;
        }
        .auto-style33 {
            width: 917px;
            height: 20px;
        }
        .auto-style39 {
            height: 29px;
            width: 412px;
        }
        .auto-style34 {
            width: 947px;
            height: 45px;
        }
        .auto-style29 {
            height: 29px;
        }
        .auto-style37 {
            width: 945px;
            height: 65px;
        }
        .auto-style38 {
            width: 194px;
            height: 29px;
        }
        .auto-style36 {
            height: 29px;
            width: 495px;
        }
        .auto-style42 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
        Equipment Routine Maintenance Record: SLBN/SDH&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" ForeColor="#33CCFF" OnClick="Button3_Click" Text="Complete Pending Tasks" Visible="False" Width="190px" />
&nbsp;<asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Size="Small" Height="16px" Width="452px">
            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="LEA" HeaderText="LEA" SortExpression="LEA" />
                <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
            </Fields>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
        </asp:DetailsView>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select  Schedule.LEA,Schedule.Node_Name from schedule where Schedule.[Node_Name]=@Node_Name">
        <SelectParameters>
            <asp:QueryStringParameter Name="Node_Name" QueryStringField="Node_Name" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p class="auto-style35">
        Completed On:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="26px" />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" VisibleDate="2024-02-19" Width="220px">
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
    <p>
        Equipment Running Environment</p>
    <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Exterior status (Power Supply System, Fire alarm, Dust, and Lightning strike,) </td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox3" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px">

</asp:TextBox>
                (Monthly)</td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Checking the ambient Temperature(15&deg;C~25&deg;C):</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" ViewStateMode="Enabled" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox4" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Monthly)</td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Equipment room cleanliness:</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList3" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox5" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Monthly)</td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Logbook updating:</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList4" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox6" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (When visit the site)</td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Air Filter Cleaning:</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList5" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox7" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Quarterly)</td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Checking Equipment room lighting:</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList6" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox8" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Monthly)</td>
        </tr>
    </table>
    <p>
        Equipment Operation Status</p>
    <table class="auto-style24" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Equipment fan status:</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList7" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style40" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox9" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Monthly)</td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">External Alarms checking (Temperature/Rectifier/Battery low, etc.):</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList8" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style40" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox10" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Monthly)</td>
        </tr>
    </table>
    <p>
        Cabling and Wiring status</p>
    <table class="auto-style33" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Fiber cable and patch codes arrangement:</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList9" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox11" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Quarterly)</td>
        </tr>
    </table>
    <p>
        Power supply voltages</p>
    <table class="auto-style34" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Checking power supply input voltages:</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList10" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style29" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox12" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Semi -Yearly)</td>
        </tr>
    </table>
    <p>
        Checking of grounding, ground cable connection and power cable connection</p>
    <table class="auto-style37" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Checking Grounding resistance:</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList11" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox13" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Semi-Yearly)</td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Checking grounding cable connection:</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList12" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox14" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Semi-Yearly)</td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Checking power cable connection</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList13" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox15" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                (Semi-Yearly)</td>
        </tr>
    </table>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Font-Bold="True" OnClick="Button1_Click" Text="Submit" Width="76px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
</asp:Content>
