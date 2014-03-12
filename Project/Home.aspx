<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="_Default" %>

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
    <br /><br />
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" DataKeyNames="EventNumber" 
         AllowPaging="True" AllowSorting="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None"  
        >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:ImageField DataImageUrlField="imageUrl">
            </asp:ImageField>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="Frequncy" HeaderText="Frequncy" 
                SortExpression="Frequncy" />
            <asp:BoundField DataField="NumOfParticipants" HeaderText="Participants" 
                SortExpression="NumOfParticipants" />
            <asp:BoundField DataField="Time" HeaderText="Time" 
                SortExpression="Time" />
            <asp:BoundField DataField="MinAge" HeaderText="MinAge" 
                SortExpression="MinAge" />
            <asp:BoundField DataField="MaxAge" HeaderText="MaxAge" 
                SortExpression="MaxAge" />
            <asp:ButtonField CommandName="Cancel" Text="Join Now" ButtonType="Button" />
            <asp:HyperLinkField NavigateUrl="joinEvent.aspx" Text="Join now!" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Left" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:bgroup14_test1ConnectionString %>" 
        SelectCommand="SELECT * FROM [View_EventsOnAir]">
    </asp:SqlDataSource>
   
</asp:Content>

<%--
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
    
    <br />
    <br />
    <br />
   
    <asp:GridView ID="eventGrv" runat="server">
   
    </asp:GridView>
   
</asp:Content>
--%>