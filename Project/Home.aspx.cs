using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial  class _Default : System.Web.UI.Page
{
 

    protected void Page_Load(object sender, EventArgs e)
    {
      EventOnAir Ev = new EventOnAir();
      eventGrv.DataSource = Ev.readTable();
      eventGrv.DataBind();
      
    }

    public void eventGrv_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            CheckBox cb = (CheckBox)e.Row.Cells[8].Controls[0];
                if (cb.Checked)
                { eventGrv.DeleteRow(e.Row.RowIndex); }
            
        }

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
