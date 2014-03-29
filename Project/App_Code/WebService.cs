using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.IO;
using System.Data.SqlClient;
using System.Data;


/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]


public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getEvents(string ss)
    {
        EventOnAir ev = new EventOnAir();
        List<EventOnAir> eventsList = new List<EventOnAir>();
        DataTable dt = ev.readTable();

        ev.Point = new Point(double.Parse(dt.Rows[2]["Lat"].ToString()), double.Parse(dt.Rows[2]["Lng"].ToString()));
        ev.Address = dt.Rows[2]["Address"].ToString();
        ev.MaxAge = int.Parse(dt.Rows[2]["MaxAge"].ToString());
        eventsList.Add(ev);

        ev.Point = new Point(double.Parse(dt.Rows[3]["Lat"].ToString()), double.Parse(dt.Rows[3]["Lng"].ToString()));
        ev.Address = dt.Rows[3]["Address"].ToString();
        ev.MaxAge = int.Parse(dt.Rows[3]["MaxAge"].ToString());
        eventsList.Add(ev);
        JavaScriptSerializer js = new JavaScriptSerializer();
        string jsonString = js.Serialize(eventsList);
        return jsonString;

    }

    public struct POI
    {

        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string Name { get; set; }
        public Point P { get; set; }
    }


}
