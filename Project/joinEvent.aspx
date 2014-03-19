<%@ Page Title="Join Event" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="JoinEvent.aspx.cs" Inherits="joinEvent" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>
    <script src="Scripts/MapScript.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bgroup14_test1ConnectionString %>"
        SelectCommand="SELECT [UserName] FROM [UsersInEvent] WHERE ([EventNumber] = @EventNumber)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="EventNumber" SessionField="EventNumber"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div>
        <asp:Label ID="EventNameLbl" CssClass="EventNameLbl" runat="server" Text="Soccer Game"
            Font-Size="XX-Large" Font-Italic="True" Font-Bold="True"></asp:Label>
    </div>
    <div id="leftdiv" style="float: left">
        <br />
        <table id="eventDetailTable">
            <tr>
                <td>
                    <asp:Label ID="AdminLbl" runat="server" Text="Admin:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ANS_AdminLbl" runat="server" Text="Omer"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MaxPlayerLbl" runat="server" Text="Max Participants:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ANS_MaxPlayerLbl" runat="server" Text="15"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="datatimelbl" runat="server" Text="Date & Time:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ANS_datatimelbl" runat="server" Text="18:00 11/12/2014"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="EventTypelbl" runat="server" Text="Event Type:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ANS_EventTypelbl" runat="server" Text="Private"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="AgeLbl" runat="server" Text="Age Range:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ANS_AgeLbl" runat="server" Text="24-30"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="locationLbl" runat="server" Text="Location:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ANS_locationLbl" runat="server" Text="?"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Frequencylbl" runat="server" Text="Frequency:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ANS_Frequency" runat="server" Text="?"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="commentLbl" runat="server" Text="Admin Comments:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="ANS_commentLbl" runat="server" Text="Be on time!!!"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td id="map-canvas" style="border: 2px ridge #999999; height: 180px; width: 300px;" colspan="2">
                </td>
            </tr>
        </table>
    </div>
    <div id="rightdiv" style="float: right; padding-right: 80px;">
        <br />
        <asp:GridView ID="playerTableGrv" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
            CellPadding="3" GridLines="Vertical" OnRowDataBound="playerTableGrv_RowDataBound1">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField></asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </div>
    <div style="margin: 400px 0px 0px 0px; text-align: center">
        <asp:Button ID="joinBTN" runat="server" Text="Join Now!" OnClick="joinBTN_Click" />
    </div>
</asp:Content>
