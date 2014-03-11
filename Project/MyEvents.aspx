<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyEvents.aspx.cs" Inherits="MyEvents" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Styles/Home.css" rel="stylesheet" type="text/css" />
</asp:Content>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <h1>
        Events:
    </h1>
    <br /><br />
    <div id="searchDiv">
        <table>
            <tr>
                <td>
                    Category:
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>All</asp:ListItem>
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
                    <asp:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" TargetControlID="kmTXT"
                        Minimum="0" Maximum="100" TargetButtonDownID="downArrow" TargetButtonUpID="upArrow">
                    </asp:NumericUpDownExtender>
                    <asp:TextBox ID="kmTXT" Text="20" runat="server" Width="40"></asp:TextBox>
                    <input type="image" id="downArrow" src="Images/down.gif" style="height: 15px;
                        width: 15px;"/>
                    <input type="image" id="upArrow" src="Images/up.gif" style="height: 15px;
                        width: 15px;"/>
                </td>
                <td>
                    Name:
                </td>
                <td>
                    <asp:TextBox ID="freeSearch" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server">Map View</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" DataKeyNames="EventNumber">
        <Columns>
            <asp:BoundField DataField="EventNumber" HeaderText="EventNumber" 
                InsertVisible="False" ReadOnly="True" SortExpression="EventNumber" />
            <asp:BoundField DataField="NumOfParticipants" HeaderText="NumOfParticipants" 
                SortExpression="NumOfParticipants" />
            <asp:BoundField DataField="Time" HeaderText="Time" 
                SortExpression="Time" />
            <asp:BoundField DataField="MinAge" HeaderText="MinAge" 
                SortExpression="MinAge" />
            <asp:BoundField DataField="MaxAge" HeaderText="MaxAge" 
                SortExpression="MaxAge" />
            <asp:BoundField DataField="Comments" HeaderText="Comments" 
                SortExpression="Comments" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="city" HeaderText="city" 
                SortExpression="city" />
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" 
                SortExpression="Expr1" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bgroup14_test1ConnectionString %>" 
        
        SelectCommand="SELECT EventOnAir.EventNumber, EventOnAir.NumOfParticipants, EventOnAir.Time, EventOnAir.MinAge, EventOnAir.MaxAge, EventOnAir.Comments, Frequncy.Description, Court.city, CategoryS.Description AS Expr1 FROM EventOnAir INNER JOIN Frequncy ON EventOnAir.FrequencyId = Frequncy.FrequencyId INNER JOIN Court ON EventOnAir.CourtId = Court.CourtId INNER JOIN CategoryS ON EventOnAir.CategoryId = CategoryS.CategoryId">
    </asp:SqlDataSource>
    
    <br />
    <br />
    <br />
   
   
</asp:Content>
