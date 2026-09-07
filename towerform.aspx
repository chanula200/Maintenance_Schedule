<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="towerform.aspx.cs" Inherits="Routine_Maintenance.towerform" %>
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
        .auto-style43 {
        height: 29px;
        width: 495px;
        font-weight: normal;
        color: #696969;
    }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
        Monthly SLT Tower Inspection Report&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Size="Small" Height="16px" Width="452px">
            <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="tower_location" HeaderText="tower_location" SortExpression="tower_location" />
                <asp:BoundField DataField="Tower_height" HeaderText="Tower_height" SortExpression="Tower_height" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            </Fields>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select tower_location,Tower_height,type from tower where tower_location=@tower_location
">
            <SelectParameters>
                <asp:QueryStringParameter Name="tower_location" QueryStringField="node_name" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p class="auto-style35">
        Completed On:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="auto-style42" Height="23px" ImageUrl="~/image/calendar.png" OnClick="ImageButton1_Click" Width="26px" />
        Month:<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" VisibleDate="2024-02-19" Width="220px" Visible="False">
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
        Overall condition of the tower:&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList44" runat="server" Height="25px" Width="146px">
            <asp:ListItem>Select</asp:ListItem>
            <asp:ListItem>Good</asp:ListItem>
            <asp:ListItem>Moderate</asp:ListItem>
            <asp:ListItem>Bad</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Tower Structure- When observe from ground level</p>
    <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Loosen bolts.</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox3" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Damaged members.</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox4" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Signs of unusual stress or vibration.</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList3" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox5" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Secureness of climbing ladders, platforms, and safety equipment.</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList4" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox6" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Fractures, bends, or defective welds on structural members.</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList5" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox7" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Any Other comments.</td>
            <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList6" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox8" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server">
        <p>
            Tower Foundation
        </p>
        <table class="auto-style24" style="font-size: large; font-weight: bold; color: #000066">
            <tr>
                <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Cracking of Concrete tower foundation(s).</td>
                <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList7" runat="server" Height="25px" Width="181px">
                        <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style40" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox9" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Signs of movement.</td>
                <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList8" runat="server" Height="25px" Width="181px">
                        <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style40" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox10" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Grading level for water drainage.</td>
                <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList9" runat="server" Height="25px" Width="181px">
                        <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style40" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox11" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Any Other comments?</td>
                <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                    <asp:DropDownList ID="DropDownList10" runat="server" Height="25px" Width="181px">
                        <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style40" style="font-size: x-small; font-weight: normal; color: #FF0000">
                    <asp:TextBox ID="TextBox12" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
            </tr>
        </table>
</asp:Panel>
<asp:Panel ID="Panel2" runat="server">
    <p>
        Guy Anchors – Guy Wires and Fittings</p>
    <table class="auto-style33" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Connection points (bottom) in satisfactory condition</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList11" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox13" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Cracking of Guy anchor .</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList12" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox14" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Rusting status.</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList13" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox15" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Slippage of Turnbuckles .</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList14" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox16" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Security and slippage of Guy cable clamps</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList15" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox17" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Damages of shackles, clevises, and thimbles </td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList16" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox18" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Anchor bolt corrosion status.</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList17" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox19" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Bends or fractures of Guy plates and rods .</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList18" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox20" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Bush, vines, and trees around Anchors.</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList19" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox21" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Any Other comments.</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList20" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style39" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox22" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Panel>
    <p>
        Antennas and installed accessories. – when observe from Ground level </p>
    <table class="auto-style34" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Loosen hardware.</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList21" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style29" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox23" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Signs of damage and shifting of any antennas, microwave dishes, feed horns, or randoms .</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList22" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style29" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox24" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Damages or displacements of antenna coaxial cables, jumpers, and fittings.</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList23" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style29" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox25" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Damages or displacement or heavy corrosion of antenna mounting brackets, supports, and bracing.</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList24" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style29" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox26" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Any Other comments.</td>
            <td class="auto-style21" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList25" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style29" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox27" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
    </table>
    <p>
        Surface condition of the tower. ( when observe from Ground level ) </p>
    <table class="auto-style37" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Painting requirement.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList26" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox28" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Rust or Corrosion condition in any part of tower.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList27" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox29" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Peeling or Fading condition of the tower.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList28" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                <br /></td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox30" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Any Other comments.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList29" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox31" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        </table>
    <p>
        Electrical and Lighting system </p>
    <table class="auto-style37" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Earth wire and tape availability.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList30" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox32" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Earth pit availability.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList31" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox33" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">SPD / Fuse availability ( only if SLT eNbs / Radio nodes exist)</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList32" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                <br /></td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox34" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Earth wire connection status ( loose/Tighten).</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList33" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox35" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Corrosion status of Earth connection point.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList34" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox36" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Earth Measurement value.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList35" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox37" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Lightning Arrestor availability.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList36" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox38" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Aircraft Warning Lamp Status (Working/Not working/Not available).</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList37" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Working</asp:ListItem>
                    <asp:ListItem>Not Working</asp:ListItem>
                    <asp:ListItem>Not Available</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox39" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Any other comments.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList38" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox40" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
    </table>
    <p>
        Other Infrastructure details</p>
    <table class="auto-style37" style="font-size: large; font-weight: bold; color: #000066">
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">SLT Fiber Availability.&nbsp; </td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList39" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox41" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Free Fiber core availability.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList40" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox42" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Power Availability ( Commercial/Generator/Commercial + Gen/Building owner).</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList41" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                <br /></td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox43" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Security Guard Availability.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList42" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                </td>
            <td class="auto-style36" style="font-size: x-small; font-weight: normal; color: #FF0000">
                <asp:TextBox ID="TextBox44" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="auto-style32" style="color: #000099; font-size: small; font-weight: normal">Obsolete/Unused Transmission related items.</td>
            <td class="auto-style38" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                <asp:DropDownList ID="DropDownList43" runat="server" Height="25px" Width="181px">
                    <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style43">
                <asp:TextBox ID="TextBox45" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                </td>
        </tr>
    </table>
    <br />
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Text="Submit" Width="76px" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
</asp:Content>
