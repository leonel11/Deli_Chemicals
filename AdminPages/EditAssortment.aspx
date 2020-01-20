<%@ Page Title="Edit assortment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditAssortment.aspx.cs" Inherits="OpenChessTeamTournament.EditAssortment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div>
        

        <br />
        <br />
        

        </div>
        <h1 style="font-style: italic; font-size: large; text-decoration: underline;">
            Edit assortment:
        </h1>
        <div>
        

            <br />
        

            <br />
        

        </div>
        <asp:SqlDataSource ID="SqlDataSourceEditAssortment" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringDeli %>" DeleteCommand="DELETE FROM [Goods] WHERE [ID_chemical] = @original_ID_chemical"
            InsertCommand="INSERT INTO [Goods] ([Chemical], [Symbol], [Tablenumber], [Characteristic], [In_stock_kg], [Price_one_kg]) VALUES (@Chemical, @Symbol, @Tablenumber, @Characteristic, @In_stock_kg, @Price_one_kg)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Goods] ORDER BY [Tablenumber]"
            
            
            UpdateCommand="UPDATE [Goods] SET [Chemical] = @Chemical, [Symbol] = @Symbol, [Tablenumber] = @Tablenumber, [Characteristic] = @Characteristic, [In_stock_kg] = @In_stock_kg, [Price_one_kg] = @Price_one_kg WHERE [ID_chemical] = @original_ID_chemical">
            <DeleteParameters>
                <asp:Parameter Name="original_ID_chemical" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Chemical" Type="String" />
                <asp:Parameter Name="Symbol" Type="String" />
                <asp:Parameter Name="Tablenumber" Type="Int32" />
                <asp:Parameter Name="Characteristic" Type="String" />
                <asp:Parameter Name="In_stock_kg" Type="String" />
                <asp:Parameter Name="Price_one_kg" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Chemical" Type="String" />
                <asp:Parameter Name="Symbol" Type="String" />
                <asp:Parameter Name="Tablenumber" Type="Int32" />
                <asp:Parameter Name="Characteristic" Type="String" />
                <asp:Parameter Name="In_stock_kg" Type="String" />
                <asp:Parameter Name="Price_one_kg" Type="Int32" />
                <asp:Parameter Name="original_ID_chemical" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>
            
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_chemical"
                DataSourceID="SqlDataSourceEditAssortment" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="ID_chemicalLabel" runat="server" 
                                Text='<%# Eval("ID_chemical") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ChemicalLabel" runat="server" Text='<%# Eval("Chemical") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SymbolLabel" runat="server" Text='<%# Eval("Symbol") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TablenumberLabel" runat="server" 
                                Text='<%# Eval("Tablenumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CharacteristicLabel" runat="server" 
                                Text='<%# Eval("Characteristic") %>' />
                        </td>
                        <td>
                            <asp:Label ID="In_stock_kgLabel" runat="server" 
                                Text='<%# Eval("In_stock_kg") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Price_one_kgLabel" runat="server" 
                                Text='<%# Eval("Price_one_kg") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="ID_chemicalLabel1" runat="server" 
                                Text='<%# Eval("ID_chemical") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ChemicalTextBox" runat="server" 
                                Text='<%# Bind("Chemical") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SymbolTextBox" runat="server" Text='<%# Bind("Symbol") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TablenumberTextBox" runat="server" 
                                Text='<%# Bind("Tablenumber") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CharacteristicTextBox" runat="server" 
                                Text='<%# Bind("Characteristic") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="In_stock_kgTextBox" runat="server" 
                                Text='<%# Bind("In_stock_kg") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Price_one_kgTextBox" runat="server" 
                                Text='<%# Bind("Price_one_kg") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" 
                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>
                                Нет данных.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="ChemicalTextBox" runat="server" 
                                Text='<%# Bind("Chemical") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SymbolTextBox" runat="server" Text='<%# Bind("Symbol") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TablenumberTextBox" runat="server" 
                                Text='<%# Bind("Tablenumber") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CharacteristicTextBox" runat="server" 
                                Text='<%# Bind("Characteristic") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="In_stock_kgTextBox" runat="server" 
                                Text='<%# Bind("In_stock_kg") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Price_one_kgTextBox" runat="server" 
                                Text='<%# Bind("Price_one_kg") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="ID_chemicalLabel" runat="server" 
                                Text='<%# Eval("ID_chemical") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ChemicalLabel" runat="server" Text='<%# Eval("Chemical") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SymbolLabel" runat="server" Text='<%# Eval("Symbol") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TablenumberLabel" runat="server" 
                                Text='<%# Eval("Tablenumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CharacteristicLabel" runat="server" 
                                Text='<%# Eval("Characteristic") %>' />
                        </td>
                        <td>
                            <asp:Label ID="In_stock_kgLabel" runat="server" 
                                Text='<%# Eval("In_stock_kg") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Price_one_kgLabel" runat="server" 
                                Text='<%# Eval("Price_one_kg") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">
                                        </th>
                                        <th runat="server">
                                            ID_chemical</th>
                                        <th runat="server">
                                            Chemical</th>
                                        <th runat="server">
                                            Symbol</th>
                                        <th runat="server">
                                            Tablenumber</th>
                                        <th runat="server">
                                            Characteristic</th>
                                        <th runat="server">
                                            In_stock_kg</th>
                                        <th runat="server">
                                            Price_one_kg</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" 
                                style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="ID_chemicalLabel" runat="server" 
                                Text='<%# Eval("ID_chemical") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ChemicalLabel" runat="server" Text='<%# Eval("Chemical") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SymbolLabel" runat="server" Text='<%# Eval("Symbol") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TablenumberLabel" runat="server" 
                                Text='<%# Eval("Tablenumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CharacteristicLabel" runat="server" 
                                Text='<%# Eval("Characteristic") %>' />
                        </td>
                        <td>
                            <asp:Label ID="In_stock_kgLabel" runat="server" 
                                Text='<%# Eval("In_stock_kg") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Price_one_kgLabel" runat="server" 
                                Text='<%# Eval("Price_one_kg") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <br/>
            <br/>
        </div>
    </div>
</asp:Content>
