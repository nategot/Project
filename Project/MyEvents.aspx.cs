using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MapPlaceHolder.Visible = false;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int num = GridView1.SelectedIndex;
        string num2 = GridView1.Rows[num].Cells[0].Text.ToString();
        Session["EventNUmber"] = num2;
        Response.Redirect("joinEvent.aspx");
    }
    protected void MapviewBTN_Click(object sender, EventArgs e)
    {
        if (GridView1.Visible)
        {
            GridView1.Visible = false;
            MapPlaceHolder.Visible = true;
            MapviewBTN.Text = "Table View";

        }
        else
        {
            GridView1.Visible = true;
            MapPlaceHolder.Visible = false;
            MapviewBTN.Text = "Map View";

        }
    }
}