<%@ Page Title="Goods" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Goods.aspx.cs" Inherits="OpenChessTeamTournament.Goods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        

        <br />
        <br />
        

    </div>
    <h1 style="font-style: italic; font-size: large; text-decoration: underline;">
        Assortment:
    </h1>
    <div>
        

        <br />
        <br />
        

    </div>
        <asp:GridView ID="GridViewGoods" runat="server" AutoGenerateColumns="False" AllowSorting="True" 
                DataSourceID="SqlDataSourceGoods" BackColor="White" 
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Vertical" 
                onselectedindexchanging="GridViewGoods_SelectedIndexChanging" 
        Width="1158px" PageSize="20" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:HyperLinkField DataNavigateUrlFields="Chemical,Symbol,Tablenumber,Characteristic,In_stock_kg,Price_one_kg" 
                    DataNavigateUrlFormatString="ChemicalInfo.aspx?chemical={0}&symbol={1}&tablenumber={2}&characteristic={3}" 
                    Text="Select" />
                    <asp:BoundField DataField="Chemical" HeaderText="Chemical" 
                                    SortExpression="Chemical" />
                    <asp:BoundField DataField="Symbol" HeaderText="Symbol" 
                                    SortExpression="Symbol" />
                    <asp:BoundField DataField="Tablenumber" HeaderText="Tablenumber" 
                                    SortExpression="Tablenumber" />    
                    <asp:BoundField DataField="Characteristic" HeaderText="Characteristic" 
                                    SortExpression="Characteristic" />    
                    <asp:BoundField DataField="In_stock_kg" HeaderText="In stock" 
                                    SortExpression="In_stock_kg" />
                    <asp:BoundField DataField="Price_one_kg" HeaderText="Price per 1 kg" 
                                    SortExpression="Price_one_kg" />                   

            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceGoods" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringDeli %>" 
        
            SelectCommand="SELECT [Chemical], [Symbol], [Tablenumber], [Characteristic], [In_stock_kg], [Price_one_kg] FROM [Goods] ORDER BY [Tablenumber]">
        </asp:SqlDataSource>
</asp:Content>
