<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ipnwform.aspx.cs" Inherits="Routine_Maintenance.ipnwform" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        *{text-shadow:none!important;box-shadow:none!important}


        *{box-sizing:border-box}
        
label{display:inline-block;margin-bottom:.5rem}
        .auto-style42 {
            margin-top: 0px;
        }
    

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
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
        IP NW Routine Maintenance Record &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
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
        Completed On:
        <label class="visually-hidden" for="inputPassword2">
        Start_Date</label>
        <asp:TextBox ID="TextBox2" runat="server" Width="128px"></asp:TextBox>
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
        Actions and Observations:</p>
    <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Filter Cleaning</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Cleaned</asp:ListItem>
                    <asp:ListItem>Not Cleaned </asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox3" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"> </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Equipment Fan Status</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" ViewStateMode="Enabled" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox4" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Patch cord arrangement</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList3" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Tidy</asp:ListItem>
                    <asp:ListItem>Need improvement</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox5" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Patch cord labelling</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList4" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Complete</asp:ListItem>
                    <asp:ListItem>Incomplete</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox6" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Earth Resistance check</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList5" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox7" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Supply Voltage</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList6" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox8" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Room Temperature</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList7" runat="server" Height="25px" Width="181px">
                    <asp:ListItem>Not Attended</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                    <asp:ListItem>Abnormal</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox9" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Submit" />
    <br />
</asp:Content>
