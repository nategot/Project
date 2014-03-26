<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="MessagePae.aspx.cs" Inherits="MessagePae" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="massageLBL" runat="server" ForeColor="Red" Font-Size="Large" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <br />
    <div>
        <asp:Button ID="RegisterBTN" runat="server" Text="Go To Register" Visible="false" />
        <asp:Button ID="BackeBtn" runat="server" Text="Go Back" Visible="false" />
    </div>
</asp:Content>
