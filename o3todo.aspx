<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="o3todo.aspx.cs" Inherits="Routine_Maintenance.o3todo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="LEA_Name" SortExpression="LEA_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LEA_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("LEA_Name", "Task_Details.aspx?&URL=ToDo&LEA_Name={0}") %>' Text='<%# Eval("LEA_Name") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MSAN" HeaderText="MSAN" ReadOnly="True" SortExpression="MSAN" />
            <asp:BoundField DataField="IPNW" HeaderText="IPNW" ReadOnly="True" SortExpression="IPNW" />
            <asp:BoundField DataField="SLBN/SDH" HeaderText="SLBN/SDH" ReadOnly="True" SortExpression="SLBN/SDH" />
            <asp:BoundField DataField="Tower" HeaderText="Tower" ReadOnly="True" SortExpression="Tower" />
            <asp:BoundField DataField="ITMC" HeaderText="ITMC" ReadOnly="True" SortExpression="ITMC" />
            </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="GetToDOListO3" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="owner3" SessionField="serviceno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
