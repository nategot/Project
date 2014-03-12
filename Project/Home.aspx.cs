using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Collections.Specialized;

public partial class _Default : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
       

    }

   






    protected void JoinBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("joinEvent.aspx");
    }
    protected void AddNewEventBTN_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewEvent.aspx");
    }

   
}
