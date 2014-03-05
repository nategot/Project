﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="NewEvent.aspx.cs" Inherits="NewEvent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script src="Scripts/JScript.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <h1 align="center">
        Create New Event</h1>
    <br />
    <br />
    <table style="float: left">
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
        </tr>
        <tr>
            <td>
                Number of Participants:
            </td>
            <td>
                <asp:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" TargetControlID="NOP"
                    Minimum="0" Maximum="100" TargetButtonDownID="downArrow" TargetButtonUpID="upArrow">
                </asp:NumericUpDownExtender>
                <asp:TextBox ID="NOP" Text="20" runat="server" Width="40"></asp:TextBox>
                <input type="image" id="downArrow" src="Images/down.gif" style="height: 15px; width: 15px;" />
                <input type="image" id="upArrow" src="Images/up.gif" style="height: 15px; width: 15px;" />
            </td>
        </tr>
        <tr>
            <td>
                Location:
            </td>
            <td>
                <asp:TextBox ID="locationTB" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Date & Time:
            </td>
            <td>
                <asp:TextBox ID="timeTB" runat="server" Width="40" Text="18:00"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="dateTB"
                    PopupButtonID="calanderBTN">
                </asp:CalendarExtender>
                <asp:TextBox ID="dateTB" runat="server"></asp:TextBox>
                <asp:ImageButton ID="calanderBTN" runat="server" ImageUrl="Images/Calendar.png" />
            </td>
        </tr>
        <tr>
            <td>
                Age Range:
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Event Type:
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Public</asp:ListItem>
                    <asp:ListItem>Private</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                Frequency:
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Once</asp:ListItem>
                    <asp:ListItem>Every Week</asp:ListItem>
                    <asp:ListItem>Every Month</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                Comment:
            </td>
            <td>
                <asp:TextBox ID="commentsTB" runat="server" TextMode="MultiLine" Text="Add your comment here"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="confirmBTN" runat="server" Text="Confirm & Publish" />
            </td>
            <td>
                <asp:Button ID="inviteBTN" runat="server" Text="Invite from list" />
            </td>
        </tr>
    </table>
    <div id="map-canvas" style="height: 200px; width: 300px; float: right;">
    </div>
</asp:Content>
