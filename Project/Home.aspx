<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Styles/Home.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>
        Events:jjj
    </h1>
    <div id="searchDiv">
        <table>
            <tr>
                <td>
                    Category:
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Soccer</asp:ListItem>
                        <asp:ListItem>Basketball</asp:ListItem>
                        <asp:ListItem>Tennis</asp:ListItem>
                        <asp:ListItem>Running</asp:ListItem>
                        <asp:ListItem>Cycling</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    Radius:
                </td>
                <td>
                    <asp:SliderExtender ID="SliderExtender1" runat="server" BoundControlID="kmTXT_b"
                        TargetControlID="kmTXT">
                    </asp:SliderExtender>
                    <asp:TextBox ID="kmTXT" Text="20" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="kmTXT_b" CssClass="kmTXT" runat="server"></asp:TextBox>
                </td>
                <td>
                    Name:
                </td>
                <td>
                    <asp:TextBox ID="freeSearch" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="EventNumber" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="EventNumber" HeaderText="EventNumber" 
                ReadOnly="True" SortExpression="EventNumber" />
            <asp:BoundField DataField="CourtId" HeaderText="CourtId" 
                SortExpression="CourtId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" 
                ReadOnly="True" SortExpression="UserId" />
            <asp:BoundField DataField="Adminname" HeaderText="Adminname" 
                SortExpression="Adminname" />
            <asp:BoundField DataField="NumOfParticipants" HeaderText="NumOfParticipants" 
                SortExpression="NumOfParticipants" />
            <asp:BoundField DataField="Category" HeaderText="Category" 
                SortExpression="Category" />
            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" 
                SortExpression="CategoryId" />
            <asp:BoundField DataField="Frequency" HeaderText="Frequency" 
                SortExpression="Frequency" />
            <asp:CheckBoxField DataField="Public/private" HeaderText="Public/private" 
                SortExpression="Public/private" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:bgroup14_test1ConnectionString %>" 
    SelectCommand="SELECT * FROM [EventS]"></asp:SqlDataSource>
    <p>
        To learn more about ASP.NET visit <a href="http://www.asp.net" title="ASP.NET Website">
            www.asp.net</a>.
    </p>
    <p>
        You can also find <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs">documentation on ASP.NET at MSDN</a>.
    </p>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
</asp:Content>
