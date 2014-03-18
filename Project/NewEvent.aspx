﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="NewEvent.aspx.cs" Inherits="NewEvent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false" type="text/javascript"></script>
    <script src="Scripts/MapScript.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <h1>
        Create New Event</h1>
    <br />
    <br />
    <table style="float: left">
        <tr>
            <td>
                Category:
            </td>
            <td>
                <asp:DropDownList ID="categoryDDL" runat="server">
                    <asp:ListItem Value="1">Soccer</asp:ListItem>
                    <asp:ListItem Value="2">Basketball</asp:ListItem>
                    <asp:ListItem Value="3">Tennis</asp:ListItem>
                    <asp:ListItem Value="4">Running</asp:ListItem>
                    <asp:ListItem Value="5">Cycling</asp:ListItem>
                    <asp:ListItem Value="6">Swimming</asp:ListItem>
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
                    PopupButtonID="calanderBTN" Format="dd/MM/yyyy">
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
                <asp:TextBox ID="AgeTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Event Type:
            </td>
            <td>
                <asp:RadioButtonList ID="EventTypeRBL" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="false" Selected>Public</asp:ListItem>
                    <asp:ListItem Value="true">Private</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                Frequency:
            </td>
            <td>
                <asp:RadioButtonList ID="FrequRBL" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected>Once</asp:ListItem>
                    <asp:ListItem Value="2">Every Week</asp:ListItem>
                    <asp:ListItem Value="3">Every Month</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                Comment:
            </td>
            <td>
                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="commentsTB"
                    WatermarkText="Add your comment here">
                </asp:TextBoxWatermarkExtender>
                <asp:TextBox ID="commentsTB" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>
    <div id="map-canvas" style="border: 2px ridge #999999;height: 200px; width: 300px; float: right;">
    </div>
    <div style="margin: 300px 0px 0px 0px; text-align: center">
        <asp:Button ID="confirmBTN" runat="server" Text="Confirm & Publish" OnClick="confirmBTN_Click" />
        <asp:Button ID="inviteBTN" runat="server" Text="Invite from list" /></div>
</asp:Content>
