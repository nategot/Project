<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>
    <script src="Scripts/MapScript.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent" ClientIDMode="Inherit">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <h1>
        &nbsp;</h1>
    <br />
   <div id="searchDiv">
        <table>
            <tr>
                <td>
                    Category:
                </td>
                <td>
                    <asp:DropDownList ID="catgoryDdl" runat="server" OnSelectedIndexChanged="catgoryDdl_SelectedIndexChanged"
                        Style="height: 22px" Font-Bold="False" AutoPostBack="True">
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
                    <asp:Button ID="MapviewBTN" CssClass="myButton" runat="server" Text="Map View" OnClick="MapviewBTN_Click"/>
                         
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="catgoryDdl" />
        </Triggers>
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" HeaderStyle-BorderStyle="Solid" 
                RowStyle-VerticalAlign="Middle" Font-Bold="True" Font-Size="Medium" 
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" BorderStyle="Solid" Font-Bold="True" 
                    ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:PlaceHolder ID="MapPlaceHolder" runat="server">
        <div id="map-canvas" style="border: 2px ridge #999999; height: 600px; width: 800px">
        </div>
    </asp:PlaceHolder>
</asp:Content>
