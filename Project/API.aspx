<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="API.aspx.cs" Inherits="Account_API" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    
   <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  
<div class="slider"></div>

		<script src="jquery.js"></script>
		<script src="jquery.nouislider.js"></script>
    <script src="Scripts/jquery.nouislider.min.js" type="text/javascript"></script>
		<link href="jquery.nouislider.css" rel="stylesheet">

		<script>

		    // On document ready, initialize noUiSlider.
		    $(function () {

		        $('.slider').noUiSlider({
		            start: [20, 30],
		            range: {
		                'min': 10,
		                'max': 40
		            }
		        });

		    });

		</script>

</asp:Content>
