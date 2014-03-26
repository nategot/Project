using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;

public partial class MessagePae : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NameValueCollection coll = Request.QueryString;
        String ans = coll["ans"];

        switch (ans)
        { case "notLogin" :
                massageLBL.Text = "Only registered users can join event";
                RegisterBTN.Visible = true;
                BackeBtn.Visible = true;
              break;
           
              
        }          
            
     
    }
}