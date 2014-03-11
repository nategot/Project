using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void confirmBTN_Click(object sender, EventArgs e)
    {
        string[] AgeStr = new string[2];
        string timedate;
        EventOnAir ev = new EventOnAir();
     
        ev.Catedory=int.Parse(categoryDDL.SelectedValue);
        ev.NumOfParti = int.Parse( NOP.Text);
        ev.Location = locationTB.Text;
        timedate = dateTB.Text + " " + timeTB.Text;
        ev.DateTime = DateTime.Parse(timedate);
        AgeStr=  AgeTxt.Text.Split('-');
        ev.MinAge = double.Parse(AgeStr[0]);
        ev.MaxAge = double.Parse(AgeStr[1]);
        ev.Frequency=int.Parse(FrequRBL.SelectedValue);
        ev.IsPrivate1 = bool.Parse(EventTypeRBL.SelectedValue);
        ev.Comments = commentsTB.Text;

        ev.insert();
       
       

    }
}