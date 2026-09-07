<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="nwtodo.aspx.cs" Inherits="Routine_Maintenance.nwtodo" %>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="GetToDOList" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="service_no" SessionField="serviceno" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </p>
</asp:Content>
