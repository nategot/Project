using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Text;
public partial class joinEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["EventNUmber"] == null) return;
        string  eventNum = (Session["EventNUmber"]).ToString();
        EventOnAir ev = new EventOnAir();
         DataTable dt=   ev.PullEvent(eventNum);
         ReadDeteail(dt);


       



        int  numofplayer= int.Parse(ANS_MaxPlayerLbl.Text);

    for (int i = 0; i < playerTableGrv.Rows.Count; i++)
        {   
            playerTableGrv.Rows[i].Cells[0].Text = (i + 1).ToString();
            
        }

    }
    public void ReadDeteail(DataTable dt)
    {
        ANS_MaxPlayerLbl.Text = dt.Rows[0]["NumOfParticipants"].ToString();
        ANS_datatimelbl.Text = dt.Rows[0]["Time"].ToString();
        ANS_EventTypelbl.Text = dt.Rows[0]["Private"].ToString();
        ANS_commentLbl.Text = dt.Rows[0]["Comments"].ToString();
        
        bool ansTemp = (bool)dt.Rows[0]["Private"];
        string temp="Public";
        if(ansTemp)
        temp="Private";
        
        ANS_EventTypelbl.Text = temp;
        ANS_AgeLbl.Text = dt.Rows[0]["MinAge"].ToString() +"-"+ dt.Rows[0]["MaxAge"].ToString();
       
        //קטגוריה תדירות ומגרש -איך עושים?
    }
    public void playerTableGrv_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
       
    }

    protected void joinBTN_Click(object sender, EventArgs e)
    { // מוסיף את השחקן לאירוע ושולח אותו חזרה לדף האירועים שלי 
        Response.Redirect("Home.aspx");
    }
}