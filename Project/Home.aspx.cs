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
using System.Windows.Forms;

public partial class _Default : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
       

    }




   
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int num= GridView1.SelectedIndex;
       string num2 =GridView1.Rows[num].Cells[0].Text.ToString();
    }
}
