using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace workdone
{

    public partial class ProfessionalProfile : System.Web.UI.Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select
        string fname;
        string lname;
        string service;
        string pic;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customer"] != null)
            {
                getcon();

                da = new SqlDataAdapter("select * from profesonalTBL where email = '" + Session["customer"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);


                if (ds.Tables[0].Rows.Count > 0)
                {
                    fname = ds.Tables[0].Rows[0]["fname"].ToString();
                    lname = ds.Tables[0].Rows[0]["lname"].ToString();
                    service = ds.Tables[0].Rows[0]["service"].ToString();
                    pic = ds.Tables[0].Rows[0]["pic"].ToString();

                    Image1.ImageUrl = pic;
                    lblpronm.Text = fname + " " + lname;
                    lblprosrv.Text = service;



                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            void getcon()
            {
                con = new SqlConnection(s);
                con.Open();
            }
        }
    }
}
