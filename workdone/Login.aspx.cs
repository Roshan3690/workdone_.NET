using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Policy;
using System.Xml.Linq;


namespace workdone
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select
        int i;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }
     
        //Save

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (!(string.IsNullOrEmpty(txtemail.Text) || string.IsNullOrEmpty(txtpass.Text)))
            {
                getcon();
                cmd = new SqlCommand("SELECT * FROM customerTBL WHERE email = '" + txtemail.Text + "' AND pass = '" + txtpass.Text + "'", con);
                i = Convert.ToInt16(cmd.ExecuteScalar());

                if (i > 0)
                {
                    if (txtemail.Text == "admin@asp.net" && txtpass.Text == "admin1234")
                    {
                        Response.Redirect("Admin/AdminUsers.aspx");
                    }
                    else
                    {
                        Session["customer"] = txtemail.Text;
                        Response.Redirect("CustomerProfile.aspx");
                        Label1.Text = Session["customer"].ToString();
                    }
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
