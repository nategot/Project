<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>
    <script src="Scripts/MapScript.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <h1>
        Events:
    </h1>
    <br />
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
                    <input type="image" id="downArrow" src="Images/down.gif" style="height: 15px; width: 15px;" />
                    <input type="image" id="upArrow" src="Images/up.gif" style="height: 15px; width: 15px;" />
                </td>
                <td>
                    Name:
                </td>
                <td>
                    <asp:TextBox ID="freeSearch" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="MapviewBTN" runat="server" Text="Map View" OnClick="MapviewBTN_Click"
                        AutoPostBack="false" />
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        DataKeyNames="EventNumber" AllowPaging="True" AllowSorting="True" CellPadding="4"
        ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="EventNumber" HeaderText="EventNumber" SortExpression="EventNumber"
                ReadOnly="True" />
            <asp:ImageField DataImageUrlField="imageUrl">
            </asp:ImageField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="NumOfParticipants" HeaderText="NumOfParticipants" SortExpression="NumOfParticipants" />
            <asp:BoundField DataField="Frequncy" HeaderText="Frequncy" SortExpression="Frequncy" />
            <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
            <asp:BoundField DataField="MinAge" HeaderText="MinAge" SortExpression="MinAge" />
            <asp:BoundField DataField="MaxAge" HeaderText="MaxAge" SortExpression="MaxAge" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                        Text="Join Now!"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:PlaceHolder ID="MapPlaceHolder" runat="server">
        <div id="map-canvas" style="border: 2px ridge #999999; height: 600px; width: 800px">
        </div>
    </asp:PlaceHolder>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bgroup14_test1ConnectionString %>"
        SelectCommand="SELECT [EventNumber], [NumOfParticipants], [Time], [MinAge], [MaxAge], [Comments], [Frequncy], [City], [Description], [imageUrl] FROM [View_EventsOnAir]">
    </asp:SqlDataSource>
</asp:Content>
