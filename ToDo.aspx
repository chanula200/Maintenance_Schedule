<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ToDo.aspx.cs" Inherits="Routine_Maintenance.ToDo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
        &nbsp;</p>
    <p>
        <%--<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField SortExpression="network_engineer">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("network_engineer") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Bind("network_engineer", "towertask_Details.aspx?&URL=ToDo&network_engineer={0}") %>'>Tower_Maintenance</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="To_Do" HeaderText="To_Do" ReadOnly="True" SortExpression="To_Do" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>--%>
        &nbsp;</p>
    <p>
        <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select tower.network_engineer,count(schedule.task) as To_Do from tower left join schedule on tower.tower_location=schedule.Node_Name where status!='Close' and SYSDATETIME() BETWEEN Schedule.VSdate AND Schedule.VEdate and platform='Tower' and task='Tower Maintenance Regional' and service_no=@service_no group by network_engineer;
">
            <SelectParameters>
                <asp:SessionParameter Name="service_no" SessionField="serviceno" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
        <br />
    </p>
</asp:Content>
