using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//New Namespace
using System.Data.SqlClient;//For Connection
using System.Data;//For Dataset
using System.Configuration;//For Connection String

namespace workdone
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select
        int userlog;
        int proflog;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;//For Connection String

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(txtemail.Text)) && !(string.IsNullOrEmpty(txtpass.Text)))
            {
                getcon();

                if (txtemail.Text == "admin@asp.net" && txtpass.Text == "admin1234")
                {
                    Session["admin"] = txtemail.Text;
                    Response.Redirect("Admin/AdminUsers.aspx");
                    return;
                }

                cmd = new SqlCommand("select count(*) from customerTBL where email = '" + txtemail.Text + "' and pass = '" + txtpass.Text + "'", con);
                userlog = Convert.ToInt16(cmd.ExecuteScalar());

                cmd = new SqlCommand("select count(*) from profesonalTBL where email = '" + txtemail.Text + "' and prof_password = '" + txtpass.Text + "'", con);
                proflog = Convert.ToInt16(cmd.ExecuteScalar());

                if (userlog > 0)
                {
                    Session["customer"] = txtemail.Text;
                    Response.Redirect("CustomerProfile.aspx");
                }
                else if (proflog > 0)
                {
                    Session["customer"] = txtemail.Text;
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Label1.Text = "Invalid Email or Password";
                }
            }
            else
            {
                Label1.Text = "Invalid Email or Password";
            }
        }
    }
}
