<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OpenChessTeamTournament.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        

        <br />
        <br />
        

    </div>
    <h1 style="font-style: italic; font-size: large; text-decoration: underline;">
        Profile:
    </h1>
    <div>
        

        <br />
        <br />
        

    </div>
    <div>
        
        Role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageMap ID="ImageMapRole" runat="server" 
            ImageUrl="~/RolesPictures/Unknown.gif">
        </asp:ImageMap>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelRole" runat="server" Text="(anonymous user)"></asp:Label>
        <br />
        <br />
        Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelUserName" runat="server" Text="Anonymous"></asp:Label>
        <br />
        <br />
        E-mail:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Label ID="LabelEMail" runat="server" Text="?"></asp:Label>
        <br />
        <br />
        Date of registration:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelRegistrationDate" runat="server" Text="Not registered"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" Height="450px" ImageUrl="~/Images/Network.jpg" 
            Width="1160px" />
        <br />
        <br />
    </div>
</asp:Content>
