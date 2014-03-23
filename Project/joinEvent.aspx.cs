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
        if (Session["EventNumber"] == null) return;
        string eventNum = (Session["EventNUmber"]).ToString();
        
        if (Session["gridTable"] == null) return;
        DataTable dt = (DataTable)HttpContext.Current.Session["gridTable"];

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["EventNumber"].ToString() == eventNum)
            {
                // ANS_AdminLbl.Text = dt.Rows[i]["AdminName"].ToString();//צריך לסדר שהאדמין ניים יגיע עם הVIEW
                ANS_MaxPlayerLbl.Text = dt.Rows[i]["NumOfParticipants"].ToString();
                iconImg.ImageUrl = dt.Rows[i]["ImageUrl"].ToString();
                ANS_datatimelbl.Text = dt.Rows[i]["Time"].ToString();
                ANS_commentLbl.Text = dt.Rows[i]["Comments"].ToString();
                ANS_Frequency.Text = dt.Rows[i]["Frequncy"].ToString();
                ANS_AgeLbl.Text = dt.Rows[i]["Age Range"].ToString() + "-" + dt.Rows[i]["MaxAge"].ToString();
                EventNameLbl.Text = dt.Rows[i]["Description"].ToString();
                User u = new User();
                u.UserId = int.Parse(dt.Rows[i]["AdminId"].ToString());
                DataTable dtName = u.CheckUserName();
                ANS_AdminLbl.Text = dtName.Rows[0]["Fname"].ToString() + " " + dtName.Rows[0]["Lname"].ToString();
                bool ansTemp = (bool)dt.Rows[0]["Private"];
                string temp = "Public";
                if (ansTemp)
                    temp = "Private";
                ANS_EventTypelbl.Text = temp;

            }
        }

    }

    protected void joinBTN_Click(object sender, EventArgs e)
    { // מוסיף את השחקן לאירוע ושולח אותו חזרה לדף האירועים שלי 
        User Newuser = new User();
        User U1 = new User();
        //U1.UserName = 
        //U1.UserPassword = 
        //U1.Fname = 
        //U1.Lname = 
        //U1.Age = ;
        //U1.City =
        //U1.Email = 

        if (Session["UserDeatail"] == null) return;
        DataTable dt = (DataTable)HttpContext.Current.Session["UserDeatail"];
        
        Response.Redirect("MyEvents.aspx");
    }

    //protected void playerTableGrv_RowDataBound1(object sender, GridViewRowEventArgs e)
    //{
    //    int numofplayer = int.Parse(ANS_MaxPlayerLbl.Text);

    //    for (int i = 0; i < playerTableGrv.Rows.Count; i++)
    //    {
    //        playerTableGrv.Rows[i].Cells[0].Text = (i + 1).ToString();

    //    }
    //    // להוסיף שורות כמספר השחקנים המ'סימלי
    //}
}