<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="Routine_Maintenance.details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">



        
        *{box-sizing:border-box}
        
                
        *{text-shadow:none!important;box-shadow:none!important}


        
        .auto-style42 {
            height: 45px;
            width: 52px;
        }
        

        .auto-style43 {
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="font-size: medium; font-weight: bold; color: #000099">
        Observation of All Sections of the Tower&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>"  SelectCommand="select tower_location,Tower_height,type from tower where tower_location=@tower_location">
        <SelectParameters>
            <asp:QueryStringParameter Name="tower_location" QueryStringField="Node_Name" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="Panel1" runat="server">
        <p class="auto-style35">
            Completed On:
            <label class="visually-hidden" for="inputPassword2">
            Start_Date</label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
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
        
        <asp:Panel ID="Panel11" runat="server">
            <asp:Panel ID="Panel12" runat="server">
                <p>
                    Tower Base and Site Details</p>
                <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Ground Conditions </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Average</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox3" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"> </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Tower Base Cleanliness Status </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Average</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox4" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Tower Base / Guy Base (Any deformation/movements ).</td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList3" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="No">Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox5" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Water stagnation erosion </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList4" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="No">Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox6" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Accessibility to the Guy Base </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList5" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="No">Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox7" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style43" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Concrete Condition</td>
                        <td class="auto-style43" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList6" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Average</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style43" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox8" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Any Splitting/Cracking/Broken condition.</td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList7" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="No">Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox9" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Base condition</td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList8" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Average</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox10" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"> </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Base Plate/Anchor bolts condition </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList9" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Average</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox11" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Nuts/Lock Nuts </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList10" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                                <asp:ListItem>Tight</asp:ListItem>
                                <asp:ListItem>Loose</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox12" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Tower Site Condition</td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList11" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Average</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox13" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Cleaning of Tower site </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList12" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Average</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox14" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style43" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Access Road Accessibility Status </td>
                        <td class="auto-style43" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList13" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>Good</asp:ListItem>
                                <asp:ListItem>Average</asp:ListItem>
                                <asp:ListItem>Bad</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style43" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox15" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                Grounding and Earth connectivity Details<br />
                <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Earth wire and tape availability </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList14" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>yes</asp:ListItem>
                                <asp:ListItem>no</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox16" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="344px"> </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Connection Status</td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList15" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>loose</asp:ListItem>
                                <asp:ListItem>tight</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox17" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Corrosion Status </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList16" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="No">Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox18" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Earth Measurement Value</td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList17" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="Attended">Attended</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox19" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Lightning Arrestor Availability </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList18" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="No">Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox20" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Aircraft Warning Lamp Status </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList19" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="Working">Working</asp:ListItem>
                                <asp:ListItem>Not Working</asp:ListItem>
                                <asp:ListItem>Not available</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox21" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                Other Infrastructure details<br />
                <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Fiber Availability </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList20" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem>yes</asp:ListItem>
                                <asp:ListItem>no</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox22" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Power Availability </td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList21" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="Commercial">Commercial</asp:ListItem>
                                <asp:ListItem>Commercial + Gen + Site owner</asp:ListItem>
                                <asp:ListItem>Generator</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox23" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Security Guard Availability</td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList22" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="yes">yes</asp:ListItem>
                                <asp:ListItem>no</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox24" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style27" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Obsolete/Unused Transmission related items.</td>
                        <td class="auto-style30" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:DropDownList ID="DropDownList23" runat="server" Height="25px" Width="181px">
                                <asp:ListItem Value="Not Attended">Not Attended</asp:ListItem>
                                <asp:ListItem Value="No">Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style41" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <asp:TextBox ID="TextBox25" runat="server" Height="31px" Rows="4" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Submit" />
                <br />
            </asp:Panel>
        </asp:Panel>
        <br />
        <br />
    </asp:Panel>
</asp:Content>
