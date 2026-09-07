<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="pendingtask.aspx.cs" Inherits="Routine_Maintenance.pendingtask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        *{text-shadow:none!important;box-shadow:none!important}


        *{box-sizing:border-box}
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p style="font-size: medium; font-weight: bold; font-style: normal; color: #000099">
        Pending Tasks&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" BackColor="#00CC66" Font-Bold="True" ForeColor="Black" OnClick="Button2_Click" Text="Task Close" Height="26px" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="False" ForeColor="Red" Visible="False"></asp:Label>
    </p>
    <p style="font-size: medium; font-weight: bold; font-style: normal; color: #000099">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Size="Small" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Node_Name" HeaderText="Node_Name" SortExpression="Node_Name" />
                <asp:BoundField DataField="platform" HeaderText="platform" SortExpression="platform" />
                <asp:BoundField DataField="maintenance_task" HeaderText="maintenance_task" SortExpression="maintenance_task" />
                <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
                <asp:TemplateField HeaderText="Status" SortExpression="Status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("Status") %>'>
                            <asp:ListItem>Not Attended</asp:ListItem>
                            <asp:ListItem>Normal</asp:ListItem>
                            <asp:ListItem>Abnormal</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Rows="4" Text='<%# Bind("Remark") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="completed_on" SortExpression="completed_on">
                    <EditItemTemplate>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" SelectedDate='<%# Bind("completed_on") %>' Width="220px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("completed_on") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select formdata.ID,formdata.Node_Name,formdata.platform,formdata.maintenance_task,Frequency,formdata.Status,formdata.Remark,formdata.completed_on from formdata left join taskdetails on formdata.Maintenance_Task=Taskdetails.Maintenance_Item where Node_Name=@Node_Name and End_Date=@End_Date;
" UpdateCommand="update formdata set status=@status, Remark=@Remark,Completed_on=@Completed_on where ID=@ID;">
            <SelectParameters>
                <asp:QueryStringParameter Name="Node_Name" QueryStringField="Node_Name" />
                <asp:QueryStringParameter Name="End_Date" QueryStringField="End_Date" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="status" />
                <asp:Parameter Name="Remark" />
                <asp:Parameter Name="Completed_on" />
                <asp:Parameter Name="ID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
