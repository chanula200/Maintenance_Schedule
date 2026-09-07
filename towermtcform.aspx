<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="towermtcform.aspx.cs" Inherits="Routine_Maintenance.towermtcform" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">



        *{box-sizing:border-box}
        
        *{text-shadow:none!important;box-shadow:none!important}


        .auto-style3 {
        width: 21px;
            height: 45px;
        }


        .auto-style4 {
            height: 45px;
        }


        .auto-style6 {
            height: 45px;
            font-weight: normal;
            font-size: small;
            color: #000099;
            width: 164px;
        }
        .auto-style7 {
            margin-bottom: 0px;
        }
        .auto-style11 {
            height: 45px;
            width: 8px;
        }
        .auto-style17 {
            height: 45px;
            width: 1129px;
        }
        .auto-style19 {
            height: 45px;
            width: 236px;
        }
        .auto-style22 {
            height: 45px;
            width: 995px;
        }
        .auto-style25 {
            height: 45px;
            width: 122px;
        }
        .auto-style28 {
            height: 45px;
            width: 2761px;
        }
        .auto-style31 {
            height: 45px;
            width: 2396px;
        }
        .auto-style32 {
            height: 45px;
            width: 440px;
        }
        .auto-style35 {
            height: 45px;
            width: 432px;
        }
        .auto-style42 {
            height: 45px;
            width: 52px;
        }
        .auto-style44 {
            height: 45px;
            font-weight: normal;
            font-size: small;
            color: #000099;
            width: 747px;
        }
        .auto-style47 {
            height: 45px;
            width: 747px;
        }
        .auto-style48 {
            height: 45px;
            width: 595px;
        }
        .auto-style53 {
            height: 45px;
            width: 164px;
        }


        .auto-style54 {
            height: 45px;
            width: 10px;
        }


        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="font-size: medium; font-weight: bold; color: #000099">
        Observation of All Sections of the Tower&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button22" runat="server" OnClick="Button22_Click" Text="Next" Width="50px" />
        &nbsp;&nbsp;&nbsp;
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
        <asp:Menu ID="NavigationMenu2" runat="server" CssClass="menu" EnableViewState="false" IncludeStyleBlock="false" Orientation="Horizontal" Width="100%" OnMenuItemClick="NavigationMenu2_MenuItemClick">
            <Items>
                <asp:MenuItem Text="Member_Details" Value="towermtcform"></asp:MenuItem>
                <asp:MenuItem Text="Surface_Condition" Value="Surface_Condition"></asp:MenuItem>
                <asp:MenuItem Text="Installed_Accessories" Value="Antenna"></asp:MenuItem>
                
            </Items>
        </asp:Menu>
        <asp:Panel ID="Panel5" runat="server">
            <asp:Panel ID="Panel6" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#000099">
                Member details of Self Supported Tower &nbsp;&nbsp;<br />
                <table class="auto-style17" style="font-size: large; font-weight: bold; color: #000066">
                    <tr>
                        <td class="auto-style47" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Loose members.</td>
                        <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                        <td class="auto-style48" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="49px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>S1</asp:ListItem>
                                <asp:ListItem>S2</asp:ListItem>
                                <asp:ListItem>S3</asp:ListItem>
                                <asp:ListItem>S4</asp:ListItem>
                                <asp:ListItem>S5</asp:ListItem>
                                <asp:ListItem>S6</asp:ListItem>
                                <asp:ListItem>S7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style11" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                        <td class="auto-style19" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList2" runat="server" Height="23px" Width="62px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                                <asp:ListItem>A-B</asp:ListItem>
                                <asp:ListItem>B-C</asp:ListItem>
                                <asp:ListItem>C-D</asp:ListItem>
                                <asp:ListItem>A-D</asp:ListItem>
                                <asp:ListItem>C-A</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:TextBox ID="TextBox1" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click1" Text="Insert" />
                        </td>
                        <td class="auto-style54" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="auto-style47" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Corroded members.</td>
                        <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                        <td class="auto-style48" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList48" runat="server" Height="20px" Width="49px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>S1</asp:ListItem>
                                <asp:ListItem>S2</asp:ListItem>
                                <asp:ListItem>S3</asp:ListItem>
                                <asp:ListItem>S4</asp:ListItem>
                                <asp:ListItem>S5</asp:ListItem>
                                <asp:ListItem>S6</asp:ListItem>
                                <asp:ListItem>S7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style11" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                        <td class="auto-style19" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList49" runat="server" Height="23px" Width="62px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                                <asp:ListItem>A-B</asp:ListItem>
                                <asp:ListItem>B-C</asp:ListItem>
                                <asp:ListItem>C-D</asp:ListItem>
                                <asp:ListItem>A-D</asp:ListItem>
                                <asp:ListItem>C-A</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:TextBox ID="TextBox10" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Insert" />
                        </td>
                        <td class="auto-style54" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="auto-style47" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Missing members.</td>
                        <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                        <td class="auto-style48" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList50" runat="server" Height="20px" Width="49px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>S1</asp:ListItem>
                                <asp:ListItem>S2</asp:ListItem>
                                <asp:ListItem>S3</asp:ListItem>
                                <asp:ListItem>S4</asp:ListItem>
                                <asp:ListItem>S5</asp:ListItem>
                                <asp:ListItem>S6</asp:ListItem>
                                <asp:ListItem>S7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style11" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                        <td class="auto-style19" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList51" runat="server" Height="23px" Width="62px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                                <asp:ListItem>A-B</asp:ListItem>
                                <asp:ListItem>B-C</asp:ListItem>
                                <asp:ListItem>C-D</asp:ListItem>
                                <asp:ListItem>A-D</asp:ListItem>
                                <asp:ListItem>C-A</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:TextBox ID="TextBox11" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Insert" />
                        </td>
                        <td class="auto-style54" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="auto-style44" spellcheck="True">Climbing Ladder Condition (Shaking/Corrosion).</td>
                        <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                        <td class="auto-style48" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList52" runat="server" Height="20px" Width="49px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>S1</asp:ListItem>
                                <asp:ListItem>S2</asp:ListItem>
                                <asp:ListItem>S3</asp:ListItem>
                                <asp:ListItem>S4</asp:ListItem>
                                <asp:ListItem>S5</asp:ListItem>
                                <asp:ListItem>S6</asp:ListItem>
                                <asp:ListItem>S7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style11" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                        <td class="auto-style19" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList53" runat="server" Height="23px" Width="62px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                                <asp:ListItem>A-B</asp:ListItem>
                                <asp:ListItem>B-C</asp:ListItem>
                                <asp:ListItem>C-D</asp:ListItem>
                                <asp:ListItem>A-D</asp:ListItem>
                                <asp:ListItem>C-A</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:TextBox ID="TextBox12" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Insert" />
                        </td>
                        <td class="auto-style54" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="auto-style47" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Platform condition Shaking/Corrosion).</td>
                        <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                        <td class="auto-style48" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList54" runat="server" Height="20px" Width="49px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>S1</asp:ListItem>
                                <asp:ListItem>S2</asp:ListItem>
                                <asp:ListItem>S3</asp:ListItem>
                                <asp:ListItem>S4</asp:ListItem>
                                <asp:ListItem>S5</asp:ListItem>
                                <asp:ListItem>S6</asp:ListItem>
                                <asp:ListItem>S7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style11" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                        <td class="auto-style19" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList55" runat="server" Height="23px" Width="62px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                                <asp:ListItem>A-B</asp:ListItem>
                                <asp:ListItem>B-C</asp:ListItem>
                                <asp:ListItem>C-D</asp:ListItem>
                                <asp:ListItem>A-D</asp:ListItem>
                                <asp:ListItem>C-A</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:TextBox ID="TextBox13" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Insert" />
                        </td>
                        <td class="auto-style54" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                    </tr>
                    <tr>
                        <td class="auto-style47" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Feeder Rack condition Shaking/Corrosion).</td>
                        <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                        <td class="auto-style48" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList3" runat="server" Height="20px" Width="49px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>S1</asp:ListItem>
                                <asp:ListItem>S2</asp:ListItem>
                                <asp:ListItem>S3</asp:ListItem>
                                <asp:ListItem>S4</asp:ListItem>
                                <asp:ListItem>S5</asp:ListItem>
                                <asp:ListItem>S6</asp:ListItem>
                                <asp:ListItem>S7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style11" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                        <td class="auto-style19" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList4" runat="server" Height="23px" Width="62px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                                <asp:ListItem>A-B</asp:ListItem>
                                <asp:ListItem>B-C</asp:ListItem>
                                <asp:ListItem>C-D</asp:ListItem>
                                <asp:ListItem>A-D</asp:ListItem>
                                <asp:ListItem>C-A</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:TextBox ID="TextBox8" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Insert" />
                        </td>
                        <td class="auto-style54" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                    </tr>
                    <tr>
                        <td class="auto-style47" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Loose and/or missing bolts and connection plates.</td>
                        <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                        <td class="auto-style48" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList5" runat="server" Height="20px" Width="49px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>S1</asp:ListItem>
                                <asp:ListItem>S2</asp:ListItem>
                                <asp:ListItem>S3</asp:ListItem>
                                <asp:ListItem>S4</asp:ListItem>
                                <asp:ListItem>S5</asp:ListItem>
                                <asp:ListItem>S6</asp:ListItem>
                                <asp:ListItem>S7</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style11" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                        <td class="auto-style19" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:DropDownList ID="DropDownList6" runat="server" Height="23px" Width="62px">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                                <asp:ListItem>A-B</asp:ListItem>
                                <asp:ListItem>B-C</asp:ListItem>
                                <asp:ListItem>C-D</asp:ListItem>
                                <asp:ListItem>A-D</asp:ListItem>
                                <asp:ListItem>C-A</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                        <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                            <asp:TextBox ID="TextBox9" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                        </td>
                        <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                            <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="Insert" />
                        </td>
                        <td class="auto-style54" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" Font-Bold="False" Font-Size="Small" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                        <asp:BoundField DataField="tower_section" HeaderText="tower_section" SortExpression="tower_section" />
                        <asp:BoundField DataField="leg" HeaderText="leg" SortExpression="leg" />
                        <asp:BoundField DataField="condition" HeaderText="condition" SortExpression="condition" />
                        <asp:BoundField DataField="observation" HeaderText="observation" SortExpression="observation" />
                        <asp:BoundField DataField="Completed_on" HeaderText="Completed_on" SortExpression="Completed_on" />
                        <asp:BoundField DataField="Updated_on" HeaderText="Updated_on" SortExpression="Updated_on" />
                        <asp:BoundField DataField="Updated_by" HeaderText="Updated_by" SortExpression="Updated_by" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="  SELECT [Node_Name], [tower_section], [leg], [condition], [observation], [Completed_on], [Updated_on], [Updated_by] FROM [temptwmtc] where type='Member details of Self Supported  Tower'"></asp:SqlDataSource>
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="Panel8" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#000099">
            Member details of Guy Mast Tower&nbsp; &nbsp;<table class="auto-style22" style="font-size: large; font-weight: bold; color: #000066">
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Any loose members.</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList56" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList57" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox14" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Corroded members.</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList58" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList59" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox15" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Any missing members.</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList60" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList61" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox16" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button14" runat="server" OnClick="Button14_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style6" spellcheck="True">Climbing Ladder Condition (Shaking/Corrosion).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList62" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList63" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox17" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button15" runat="server" OnClick="Button15_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Platform condition Shaking/Corrosion).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList64" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList65" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox18" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button16" runat="server" OnClick="Button16_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Feeder Rack condition Shaking/Corrosion).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList66" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList67" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox19" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button17" runat="server" OnClick="Button17_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Loose and/or missing bolts and connection plates</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList68" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList69" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox20" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button18" runat="server" OnClick="Button18_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Condition of Guy Wires (Corrosion/Break/Creepers).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList70" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList71" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox21" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button19" runat="server" OnClick="Button19_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Guy Tension status (Sag /Tight).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList72" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList73" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox22" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button20" runat="server" OnClick="Button20_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style53" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Turnbuckles condition (Corrosion).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style28" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList76" runat="server" Height="20px" Width="49px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>S1</asp:ListItem>
                            <asp:ListItem>S2</asp:ListItem>
                            <asp:ListItem>S3</asp:ListItem>
                            <asp:ListItem>S4</asp:ListItem>
                            <asp:ListItem>S5</asp:ListItem>
                            <asp:ListItem>S6</asp:ListItem>
                            <asp:ListItem>S7</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;"></td>
                    <td class="auto-style31" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList77" runat="server" Height="23px" Width="62px">
                            <asp:ListItem>0</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>A-B</asp:ListItem>
                            <asp:ListItem>B-C</asp:ListItem>
                            <asp:ListItem>C-D</asp:ListItem>
                            <asp:ListItem>A-D</asp:ListItem>
                            <asp:ListItem>C-A</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox24" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style25" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button21" runat="server" OnClick="Button21_Click" Text="Insert" />
                    </td>
                    <td class="auto-style32" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel9" runat="server" CssClass="auto-style7">
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT [Node_Name], [condition], [tower_section], [leg], [observation], [End_Date], [Completed_on], [Updated_on], [Updated_by] FROM [temptwmtc] where type='Member details of Guy Mast Tower'"></asp:SqlDataSource>
        </asp:Panel>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                <asp:BoundField DataField="tower_section" HeaderText="tower_section" SortExpression="tower_section" />
                <asp:BoundField DataField="leg" HeaderText="leg" SortExpression="leg" />
                <asp:BoundField DataField="condition" HeaderText="condition" SortExpression="condition" />
                <asp:BoundField DataField="observation" HeaderText="observation" SortExpression="observation" />
                <asp:BoundField DataField="Completed_on" HeaderText="Completed_on" SortExpression="Completed_on" />
                <asp:BoundField DataField="Updated_on" HeaderText="Updated_on" SortExpression="Updated_on" />
                <asp:BoundField DataField="Updated_by" HeaderText="Updated_by" SortExpression="Updated_by" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="  SELECT [Node_Name], [tower_section], [leg], [condition], [observation], [Completed_on], [Updated_on], [Updated_by] FROM [temptwmtc] where type='Member details of Guy Mast Tower';"></asp:SqlDataSource>
        <br />
        <br />
    </asp:Panel>
</asp:Content>
