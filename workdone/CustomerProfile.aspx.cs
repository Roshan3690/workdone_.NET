using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace workdone
{

    public partial class CustomerProfile : System.Web.UI.Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select
        string name;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customer"] != null)
            {
                getcon();

                da = new SqlDataAdapter("select * from customerTBL where email = '" + Session["customer"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                name = ds.Tables[0].Rows[0]["fname"].ToString();

                lblCustomerFullName.Text = "Welcome " + name;
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }


    }
}

