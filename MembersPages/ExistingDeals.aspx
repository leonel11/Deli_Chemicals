<%@ Page Title="Existing deals" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExistingDeals.aspx.cs" Inherits="OpenChessTeamTournament.ExistingDeals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div>
            
            <br />
            
        </div>
        <div>
            

            <br />
            

            <asp:Label ID="Label1" runat="server" Font-Italic="True" Font-Overline="False" 
                Font-Size="Large" Font-Strikeout="False" Font-Underline="False" 
                Text="Your existing deals:"></asp:Label>
            <br />
            

            <asp:HiddenField ID="HiddenFieldUserName" runat="server" Value="?" />
            

            <br />
            

            <br />
            <asp:SqlDataSource ID="SqlDataSourceExistingDeals" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringDeli %>" 
                
                SelectCommand="SELECT * FROM [Ordergoods] WHERE ([Client] = @Client) ORDER BY [ID_order]" 
                onprerender="Page_Load" ConflictDetection="CompareAllValues" 
                DeleteCommand="DELETE FROM [Ordergoods] WHERE [ID_order] = @original_ID_order AND [Client] = @original_Client AND [Last_name] = @original_Last_name AND [First_name] = @original_First_name AND [EMail] = @original_EMail AND [Order_string] = @original_Order_string AND [Delivery] = @original_Delivery AND [Total_cost] = @original_Total_cost" 
                InsertCommand="INSERT INTO [Ordergoods] ([Client], [Last_name], [First_name], [EMail], [Order_string], [Delivery], [Total_cost]) VALUES (@Client, @Last_name, @First_name, @EMail, @Order_string, @Delivery, @Total_cost)" 
                OldValuesParameterFormatString="original_{0}" 
                
                UpdateCommand="UPDATE [Ordergoods] SET [Client] = @Client, [Last_name] = @Last_name, [First_name] = @First_name, [EMail] = @EMail, [Order_string] = @Order_string, [Delivery] = @Delivery, [Total_cost] = @Total_cost WHERE [ID_order] = @original_ID_order AND [Client] = @original_Client AND [Last_name] = @original_Last_name AND [First_name] = @original_First_name AND [EMail] = @original_EMail AND [Order_string] = @original_Order_string AND [Delivery] = @original_Delivery AND [Total_cost] = @original_Total_cost">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID_order" Type="Int32" />
                        <asp:Parameter Name="original_Client" Type="String" />
                        <asp:Parameter Name="original_Last_name" Type="String" />
                        <asp:Parameter Name="original_First_name" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_Order_string" Type="String" />
                        <asp:Parameter Name="original_Delivery" Type="String" />
                        <asp:Parameter Name="original_Total_cost" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Client" Type="String" />
                        <asp:Parameter Name="Last_name" Type="String" />
                        <asp:Parameter Name="First_name" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="Order_string" Type="String" />
                        <asp:Parameter Name="Delivery" Type="String" />
                        <asp:Parameter Name="Total_cost" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenFieldUserName" Name="Client" 
                            PropertyName="Value" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Client" Type="String" />
                        <asp:Parameter Name="Last_name" Type="String" />
                        <asp:Parameter Name="First_name" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="Order_string" Type="String" />
                        <asp:Parameter Name="Delivery" Type="String" />
                        <asp:Parameter Name="Total_cost" Type="Int32" />
                        <asp:Parameter Name="original_ID_order" Type="Int32" />
                        <asp:Parameter Name="original_Client" Type="String" />
                        <asp:Parameter Name="original_Last_name" Type="String" />
                        <asp:Parameter Name="original_First_name" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_Order_string" Type="String" />
                        <asp:Parameter Name="original_Delivery" Type="String" />
                        <asp:Parameter Name="original_Total_cost" Type="Int32" />
                    </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewExistingDeals" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID_order" 
                DataSourceID="SqlDataSourceExistingDeals" ForeColor="Black" 
                GridLines="Vertical" Width="1156px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField SelectText="Select" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID_order" HeaderText="ID deal" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ID_order" />
                    <asp:BoundField DataField="Client" HeaderText="Client" 
                        SortExpression="Client" />
                    <asp:BoundField DataField="Last_name" HeaderText="Last name" 
                        SortExpression="Last_name" />
                    <asp:BoundField DataField="First_name" HeaderText="First name" 
                        SortExpression="First_name" />
                    <asp:BoundField DataField="EMail" HeaderText="E-mail" 
                        SortExpression="EMail" />
                    <asp:BoundField DataField="Order_string" HeaderText="Deal" 
                        SortExpression="Order_string" />
                    <asp:BoundField DataField="Delivery" HeaderText="Delivery" 
                        SortExpression="Delivery" />
                    <asp:BoundField DataField="Total_cost" HeaderText="Cost" 
                        SortExpression="Total_cost" />
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
            <br />
            <br />
                <div>
                <script type = "text/javascript">
                    function Confirm() {
                        var confirm_value = document.createElement("INPUT");
                        confirm_value.type = "hidden";
                        confirm_value.name = "confirm_value";
                        if (confirm("Are you sure, that you want to cancel this deal?")) {
                            confirm_value.value = "Yes";
                        } else {
                            confirm_value.value = "No";
                        }
                        document.forms[0].appendChild(confirm_value);
                    }
                </script>
                <asp:Button ID="ButtonCancelDeal" runat="server" Text="Cancel selected deal!" 
                oncommand="ButtonCancelDeal_Command" OnClientClick = "Confirm()"/>
            </div>
            <br />
            <br />
            

        </div>
    </div>
</asp:Content>
