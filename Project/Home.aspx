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
            </tr>
        </table>
    </div>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EventNumber"
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="EventNumber" HeaderText="EventNumber" ReadOnly="True"
                SortExpression="EventNumber" />
            <asp:BoundField DataField="CourtId" HeaderText="CourtId" SortExpression="CourtId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" InsertVisible="False" ReadOnly="True"
                SortExpression="UserId" />
            <asp:BoundField DataField="Adminname" HeaderText="Adminname" SortExpression="Adminname" />
            <asp:BoundField DataField="NumOfParticipants" HeaderText="NumOfParticipants" SortExpression="NumOfParticipants" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId" />
            <asp:BoundField DataField="Frequency" HeaderText="Frequency" SortExpression="Frequency" />
            <asp:CheckBoxField DataField="Public/private" HeaderText="Public/private" SortExpression="Public/private" />
             <asp:TemplateField >
                <ItemTemplate>
                      <asp:Button  ID="joinBTN" runat="server" Text="Join" />
                </ItemTemplate>
               
           <%--     <ControlStyle Width="25px" />
                <ItemStyle Width="150px" />--%>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bgroup14_test1ConnectionString %>"
        SelectCommand="SELECT * FROM [EventS]"></asp:SqlDataSource>
</asp:Content>
