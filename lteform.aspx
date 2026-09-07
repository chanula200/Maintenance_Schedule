<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="lteform.aspx.cs" Inherits="Routine_Maintenance.lteform" %>
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
        .auto-style43 {
            width: 1014px;
            height: 53px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
        LTE eNodeB Routine Maintenance Checklist&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Size="Small" Height="16px" Width="452px">
            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="LEA" HeaderText="LEA" SortExpression="LEA" />
                <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            </Fields>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
        </asp:DetailsView>
    </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select  Schedule.LEA,Schedule.Node_Name,Schedule.type from schedule where Schedule.[Node_Name]=@Node_Name and platform='eNodeB'">
        <SelectParameters>
            <asp:QueryStringParameter Name="Node_Name" QueryStringField="Node_Name" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p class="auto-style35">
        Completed On:
        <label class="visually-hidden" for="inputPassword2">
        Start_Date</label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="26px" />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
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
    </p>
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        Cabin Condition :Indoor Only<br />
        <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Cabin Door Lock Inspection:</td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="181px">
                        <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                        <asp:ListItem>Working</asp:ListItem>
                        <asp:ListItem>Faulty</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox3" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Cabin Gutters Cleaning</td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" ViewStateMode="Enabled" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>Working</asp:ListItem>
                        <asp:ListItem>Faulty</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox4" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Air Conditioning Unit (Outdoor &amp; Indoor) Inspection &amp; Maintenance </td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList3" runat="server" Height="25px" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>Working</asp:ListItem>
                        <asp:ListItem>Faulty</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox5" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Cabin Roof Inspection </td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList4" runat="server" Height="25px" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>OK</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox6" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Cabin room Floor Cleaning/Vacuum </td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList5" runat="server" Height="25px" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>OK</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox7" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">BBU Rack Cleaning/Vacuum </td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList6" runat="server" Height="25px" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>OK</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox8" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Rectifier Rack Cleaning/Vacuum </td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList7" runat="server" Height="25px" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>OK</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox9" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Indoor Light Inspection</td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList8" runat="server" Height="25px" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>OK</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox10" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Outdoor Light Inspection</td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList9" runat="server" Height="25px" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>OK</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox11" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        Cabin Condition :Outdoor Only<br />
        <table class="auto-style43" style="font-size: large; font-weight: bold; color: #000066">
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Cabin Door Lock Inspection:</td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList10" runat="server" Height="25px" Width="181px">
                        <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                        <asp:ListItem>Working</asp:ListItem>
                        <asp:ListItem>Faulty</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox12" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Outdoor Cabin Condition</td>
                <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList11" runat="server" Height="25px" ViewStateMode="Enabled" Width="181px">
                        <asp:ListItem>Not Attended</asp:ListItem>
                        <asp:ListItem>Ok</asp:ListItem>
                        <asp:ListItem>Not Ok</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox13" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p>
        Rectifier &amp; Battery Bank condition&nbsp;</p>
    <table class="auto-style43" style="font-size: large; font-weight: bold; color: #000066" __designer:mapid="793">
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">Battery Bank Condition</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList12" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Checked</asp:ListItem>
                    <asp:ListItem>Faulty</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox14" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px" placeholder="Enter The Measured Value Here"> </asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">Battery Bank Load Test</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList13" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Pass</asp:ListItem>
                    <asp:ListItem>Fail</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox15" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">Rectifier Module count</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList14" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Checked</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox16" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px" placeholder="Enter The No. of Modules Here"></asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">Rectifier Module Working status </td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList15" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Working</asp:ListItem>
                    <asp:ListItem>Faulty</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox17" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px" placeholder="Specify The Faulty Modules Here"></asp:TextBox>
            </td>
        </tr>
    </table>
    <p>
        Power input &amp; Grounding</p>
    <table class="auto-style43" style="font-size: large; font-weight: bold; color: #000066" __designer:mapid="793">
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">ECB Availability</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList16" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox18" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px" placeholder="Enter The No. of ECBs Here"> </asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">SPD Status</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList17" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Working</asp:ListItem>
                    <asp:ListItem>Faulty</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox19" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">RCCB Status</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList18" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Working</asp:ListItem>
                    <asp:ListItem>Faulty</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox20" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">Cable Rack Inspection &amp; check corrosion</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList19" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Ok</asp:ListItem>
                    <asp:ListItem>Not ok</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox21" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px" ></asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">Any cable Tie is broken</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList20" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox22" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px" ></asp:TextBox>
            </td>
        </tr>
        <tr __designer:mapid="794">
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal" __designer:mapid="795">Meter Cubical Physical Inspection</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;" __designer:mapid="796">
                <asp:DropDownList ID="DropDownList21" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Ok</asp:ListItem>
                    <asp:ListItem>Not ok</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000" __designer:mapid="798">
                <asp:TextBox ID="TextBox23" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
    </p>
</asp:Content>
