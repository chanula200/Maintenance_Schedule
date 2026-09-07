<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Antenna.aspx.cs" Inherits="Routine_Maintenance.Antenna" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        
        *{text-shadow:none!important;box-shadow:none!important}


        
        *{box-sizing:border-box}
        
        .auto-style42 {
            height: 45px;
            width: 52px;
        }
        

        .auto-style3 {
        width: 21px;
            height: 45px;
        }


        .auto-style4 {
            height: 45px;
        }


        .auto-style43 {
            height: 45px;
            width: 1024px;
        }
        .auto-style50 {
            height: 45px;
            width: 372px;
        }
        .auto-style51 {
            height: 45px;
            width: 305px;
        }
        .auto-style52 {
            height: 45px;
            width: 207px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="font-size: medium; font-weight: bold; color: #000099">
        Observation of All Sections of the Tower&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button22" runat="server" OnClick="Button22_Click" Text="Next" Width="50px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        <asp:Panel ID="Panel10" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="#000099">
            Antennas and installed accessories&nbsp;<table class="auto-style43" style="font-size: large; font-weight: bold; color: #000066">
                <tr>
                    <td class="auto-style50" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Antennas and feedlines condition (Loose/Tight).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style51" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList78" runat="server" Height="20px" Width="49px">
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
                    <td class="auto-style52" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList83" runat="server" Height="23px" Width="62px">
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
                        <asp:TextBox ID="TextBox25" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button23" runat="server" OnClick="Button23_Click" Text="Insert" />
                    </td>
                    <td class="auto-style4" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000">&nbsp; </td>
                </tr>
                <tr>
                    <td class="auto-style50" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Antenna connector condition (Disconnection/Loose).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style51" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList79" runat="server" Height="20px" Width="49px">
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
                    <td class="auto-style52" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList84" runat="server" Height="23px" Width="62px">
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
                        <asp:TextBox ID="TextBox26" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button24" runat="server" OnClick="Button24_Click" Text="Insert" />
                    </td>
                    <td class="auto-style4" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style50" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Antenna mounts (Loose, Bent, Cracked or any movement).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style51" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList80" runat="server" Height="20px" Width="49px">
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
                    <td class="auto-style52" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList85" runat="server" Height="23px" Width="62px">
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
                        <asp:TextBox ID="TextBox27" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button25" runat="server" OnClick="Button25_Click" Text="Insert" />
                    </td>
                    <td class="auto-style4" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style50" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Randoms and/or cover conditions.</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style51" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList81" runat="server" Height="20px" Width="49px">
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
                    <td class="auto-style52" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList86" runat="server" Height="23px" Width="62px">
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
                        <asp:TextBox ID="TextBox28" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button26" runat="server" OnClick="Button26_Click" Text="Insert" />
                    </td>
                    <td class="auto-style4" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style50" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Visual Inspection on vertically Alignment</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style51" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList82" runat="server" Height="20px" Width="49px">
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
                    <td class="auto-style52" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Relevant Leg</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList87" runat="server" Height="23px" Width="62px">
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
                        <asp:TextBox ID="TextBox29" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button27" runat="server" OnClick="Button27_Click" Text="Insert" />
                    </td>
                    <td class="auto-style4" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel11" runat="server">
            <asp:Panel ID="Panel12" runat="server">
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource5" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                        <asp:BoundField DataField="Completed_on" HeaderText="Completed_on" SortExpression="Completed_on" />
                        <asp:BoundField DataField="Updated_on" HeaderText="Updated_on" SortExpression="Updated_on" />
                        <asp:BoundField DataField="Updated_by" HeaderText="Updated_by" SortExpression="Updated_by" />
                        <asp:BoundField DataField="condition" HeaderText="condition" SortExpression="condition" />
                        <asp:BoundField DataField="tower_section" HeaderText="tower_section" SortExpression="tower_section" />
                        <asp:BoundField DataField="leg" HeaderText="leg" SortExpression="leg" />
                        <asp:BoundField DataField="observation" HeaderText="observation" SortExpression="observation" />
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
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT [Node_Name], [condition], [tower_section], [leg], [observation],[Completed_on], [Updated_on], [Updated_by] FROM [temptwmtc] where type='Antennas and installed accessories';"></asp:SqlDataSource>
            </asp:Panel>
        </asp:Panel>
        <br />
        <br />
    </asp:Panel>
</asp:Content>
