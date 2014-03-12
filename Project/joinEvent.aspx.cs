using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class joinEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        int  numofplayer= int.Parse(ANS_MaxPlayerLbl.Text);

    for (int i = 0; i < playerTableGrv.Rows.Count; i++)
        {   
            playerTableGrv.Rows[i].Cells[0].Text = (i + 1).ToString();
            
        }

    }
    public void playerTableGrv_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
       
    }

    protected void joinBTN_Click(object sender, EventArgs e)
    { // מוסיף את השחקן לאירוע ושולח אותו חזרה לדף האירועים שלי 
        Response.Redirect("Home.aspx");
    }
}