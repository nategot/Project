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
       EventOnAir Ev = new EventOnAir();
       DataTable dt= Ev.readTable();
       eventGrv.DataSource = dt;
       for (int i = 0; i < dt.Rows.Count; i++)
       {
           if (bool.Parse(dt.Rows[i].ItemArray[5].ToString()))
           {
               dt.Rows.Remove(dt.Rows[i--]);
           }
       }
       dt.Columns.Remove("private");
       eventGrv.DataSource = dt;
       eventGrv.DataBind();

        BoundField field = new BoundField();
        field.HeaderText = "JoinNow";
        DataControlField col;
        col = field;
        eventGrv.Columns.Insert(eventGrv.Columns.Count, col);
        eventGrv.DataBind();
        AddButton(eventGrv);


    }

    public void AddButton( GridView g)
    {
        if (!(IsPostBack))
        {
            for (int i = 0; i < g.Rows.Count; i++)
            {
                Button JoinBtn = new Button();
                JoinBtn.Text = " Join Now";
                eventGrv.Rows[i].Cells[0].Controls.Add(JoinBtn);
            }
        }
    }

    // לא מגיע לפה?
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
