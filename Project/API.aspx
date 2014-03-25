﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="API.aspx.cs" Inherits="Account_API" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <script src="../Scripts/MapScriptAPI.js" type="text/javascript"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div id="panel">
      <input id="address" type="textbox" value="Sydney, NSW">
      <input type="button" value="Geocode" onclick="codeAddress()">
    </div>
    <div id="map-canvas"></div>

</asp:Content>
