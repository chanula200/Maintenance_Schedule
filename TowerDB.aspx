<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TowerDB.aspx.cs" Inherits="Routine_Maintenance.TowerDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        
        *{text-shadow:none!important;box-shadow:none!important}


        *{box-sizing:border-box}
        
        .auto-style9 {
        height: 29px;
    }
        .auto-style10 {
            width: 883px;
        }
        .auto-style11 {
            width: 332px;
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentboddy" runat="server">
    <p>
        <br />
    <table class="auto-style10">
     <tr>
            <td class="auto-style9"></td>
            <td class="auto-style11">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="#009933" BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSource2" Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="status" SortExpression="status">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink4" runat="server">HyperLink</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                    </Columns>
                    <RowStyle BorderColor="#009900" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BorderColor="#009933" BorderStyle="Solid" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select status,count(maintenance_task) from formdata where Maintenance_Task='Overall condition of the tower' and status='Good' group by Status"></asp:SqlDataSource>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style9">
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BorderColor="#CC9900" BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSource3" Font-Bold="True" ForeColor="#CC9900" HorizontalAlign="Center" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="status" SortExpression="status">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink7" runat="server">HyperLink</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                    </Columns>
                    <RowStyle BorderColor="#CC9900" BorderStyle="Solid" BorderWidth="2px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BorderColor="#009933" BorderStyle="Solid" />
                </asp:GridView>
            </td>
            <td class="auto-style9">
                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSource1" Font-Bold="True" ForeColor="#CC0000" HorizontalAlign="Center" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="status" SortExpression="status">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink8" runat="server">HyperLink</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                    </Columns>
                    <EditRowStyle BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="1px" ForeColor="#CC0000" />
                    <RowStyle BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="2px" ForeColor="#CC0000" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BorderColor="#CC0000" BorderStyle="Solid" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select status,count(maintenance_task) from formdata where Maintenance_Task='Overall condition of the tower' and status='Moderate' group by Status"></asp:SqlDataSource>
            </td>
            <td class="auto-style9"></td>
        </tr>
           </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMSConnectionString %>" SelectCommand="select status,count(maintenance_task) from formdata where Maintenance_Task='Overall condition of the tower' and status='Bad' group by Status"></asp:SqlDataSource>
    </p>
</asp:Content>
