<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="surface_condition.aspx.cs" Inherits="Routine_Maintenance.surface_condition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        
        *{text-shadow:none!important;box-shadow:none!important}


        
        *{box-sizing:border-box}
        
        
        .auto-style4 {
            height: 45px;
        }


        .auto-style3 {
        width: 21px;
            height: 45px;
        }


        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
        Observation of All Sections of the Tower&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Text="Label"></asp:Label>
    &nbsp;<asp:Button ID="Button22" runat="server" OnClick="Button22_Click" Text="Next" Width="50px" />
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
            <asp:QueryStringParameter Name="tower_location" QueryStringField="Node_name" />
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
        <asp:Panel ID="Panel2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#000099">
            Surface Condition of Tower<br />
            <table class="auto-style14" style="font-size: large; font-weight: bold; color: #000066">
                <tr>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Paint condition (Fade/Peel off).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
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
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox3" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" />
                    </td>
                    <td class="auto-style4" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Galvanizing condition (Peel off).</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList45" runat="server" Height="20px" Width="49px">
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
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox4" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button2" runat="server" Text="Insert" OnClick="Button2_Click" />
                    </td>
                    <td class="auto-style4" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
                <tr>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal">Rust and/or corrosion conditions.</td>
                    <td class="auto-style3" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal"></td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Tower Section</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:DropDownList ID="DropDownList46" runat="server" Height="20px" Width="49px">
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
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">&nbsp;</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">Observation</td>
                    <td class="auto-style4" spellcheck="True" style="color: #000099; font-size: small; font-weight: normal; font-style: italic;">
                        <asp:TextBox ID="TextBox5" runat="server" Height="30px" Rows="4" TextMode="MultiLine" Width="349px"></asp:TextBox>
                    </td>
                    <td class="auto-style4" spellcheck="True" style="color: #FF0000; font-size: x-small; font-weight: normal;">
                        <asp:Button ID="Button3" runat="server" Text="Insert" OnClick="Button3_Click" />
                    </td>
                    <td class="auto-style4" spellcheck="True" style="font-size: x-small; font-weight: normal; color: #FF0000"></td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                <asp:BoundField DataField="condition" HeaderText="condition" SortExpression="condition" />
                <asp:BoundField DataField="tower_section" HeaderText="tower_section" SortExpression="tower_section" />
                <asp:BoundField DataField="leg" HeaderText="leg" SortExpression="leg" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="SELECT [Node_Name], [condition], [tower_section], [leg], [observation], [Completed_on], [Updated_on], [Updated_by] FROM [temptwmtc]"></asp:SqlDataSource>
        <br />
    </asp:Panel>
</asp:Content>
