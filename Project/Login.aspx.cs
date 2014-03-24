using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginBTN_Load(object sender, EventArgs e)
    {

        User u = new User();
        u.UserPassword=Password.Text;
        u.Email=Email.Text;
        DataTable dt =u.CheckPass();

        if (dt.Rows[0]["UserPassword"].ToString()==u.UserPassword)
        {   string username= dt.Rows[0]["Username"].ToString();
            HttpContext.Current.Session["UserDeatail"]=dt;
            MessageBox.Show("Log In Successfully hello "+ username, "Successfully", MessageBoxButtons.OK, MessageBoxIcon.Information);
        
        }
        else
        {
            MessageBox.Show("Worng Password or Email  ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Stop);
        }
       
    }
}