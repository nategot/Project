﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

public partial class NewEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 

    }
    protected void confirmBTN_Click(object sender, EventArgs e)
    {
        string[] AgeStr = new string[2];
        string[] latlagArr = new string[2];
        string timedate;
        EventOnAir ev = new EventOnAir();

        //take lat lng
        string latlong= LatLOngHIde.Value;
        latlagArr = latlong.Split(',');
        latlagArr[0]=latlagArr[0].Remove(0, 1);
        latlagArr[1]=latlagArr[1].Remove(latlagArr[1].Length - 1, 1);
        string address = CityHIde.Value;
        
        //insert to the Event class
        ev.Lat = double.Parse(latlagArr[0]);
        ev.Lng = double.Parse(latlagArr[1]);
        ev.Address = address;

       
        DataTable dt = (DataTable)HttpContext.Current.Session["UserDeatail"];
        ev.AdminID=int.Parse( dt.Rows[0]["UserId"].ToString());
     
        ev.Catedory=int.Parse(categoryDDL.SelectedValue);
        ev.NumOfParti = int.Parse( NOP.Text);
        timedate = dateTB.Text + " " + timeTB.Text;
        ev.DateTime = DateTime.Parse(timedate);
        
        AgeStr=  AgeTxt.Text.Split('-');
        ev.MinAge = double.Parse(AgeStr[0]);
        ev.MaxAge = double.Parse(AgeStr[1]);
        ev.Frequency=int.Parse(FrequRBL.SelectedValue);
        ev.IsPrivate1 = bool.Parse(EventTypeRBL.SelectedValue);
        ev.Comments = commentsTB.Text;
        
        int numEfect =ev.insert();
        if (numEfect == 0)
        {
            MessageBox.Show("the Event wasnt added ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Stop);
        }
        else
        {
            MessageBox.Show("the Event was added Successfully", "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Response.Redirect("Project/Home.aspx");//לשנות לMYEVNTS
        }

    }
}