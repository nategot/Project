using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Account_API : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GMap1.GZoom = 9;
        GMap1.Add(new GControl(GControl.preBuilt.LargeMapControl));
      
        GeoCoding geoCoding = new GeoCoding();

        geoCoding.show = GeoCoding.ShowEnum.infowindow;
        geoCoding.openedOnLoad = true;
        geoCoding.errorText = "Not found";
        geoCoding.buttonText = "Search";
        geoCoding.infoText = "GeoCode";
        geoCoding.baseCountryCode = "au"; // Search Newcastle, and you'll find it elsewhere...
        // geoCoding.viewport = new GLatLngBounds(new GLatLng(44, 14), new GLatLng(46, 16));

        geoCoding.showErrorCode = true;

        GMap1.Add(geoCoding);
    }
}