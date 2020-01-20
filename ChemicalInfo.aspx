<%@ Page Title="Chemical Information" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChemicalInfo.aspx.cs" Inherits="OpenChessTeamTournament.ChemicalInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
        
        <asp:ImageMap ID="ImageMapChemical" runat="server">
        </asp:ImageMap>
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Chemical:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelChemical" runat="server" Text="?"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Symbol:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelSymbol" runat="server" Text="?"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Atomic number:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelTableNumber" runat="server" Text="?"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Characteristic:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelCharacteristic" runat="server" Text="-"></asp:Label>
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonBack" runat="server" Text="&lt;  Back" 
            PostBackUrl="~/Goods.aspx"/>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonMakeDeal" runat="server" onclick="ButtonMakeDeal_Click" 
            Text="Go to make a deal" />
        <br />
        </div>
</asp:Content>
