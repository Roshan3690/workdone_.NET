using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace workdone
{
    public partial class ProfessionalProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fname;
        string lname;
        string service;
        string pic;

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
                if (!IsPostBack)
                {
                    getcon();
                    string id = Request.QueryString["id"];

                    if (!string.IsNullOrEmpty(id))
                    {
                        da = new SqlDataAdapter("select * from profesonalTBL where Pid = '" + id + "'", con);

                        ds = new DataSet();
                        da.Fill(ds);
                    }
                    else
                    {
                        Response.Redirect("Professionals.aspx");
                    }




                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        fname = ds.Tables[0].Rows[0]["fname"].ToString();
                        lname = ds.Tables[0].Rows[0]["lname"].ToString();
                        service = ds.Tables[0].Rows[0]["service"].ToString();
                        pic = ds.Tables[0].Rows[0]["pic"].ToString();
                        Image1.ImageUrl = string.IsNullOrEmpty(pic) ? "https://randomuser.me/api/portraits/men/32.jpg" : pic;
                        lblpronm.Text = fname + " " + lname;
                        lblprosrv.Text = service;
                        Label2.Text = fname + " " + lname;
                        lblCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
                        lblExperience.Text = ds.Tables[0].Rows[0]["experience"].ToString() + " Yrs";

                        cmd = new SqlCommand("select count(*) from bookingTBL where pro_id = '" + id + "' and status = 'Accepted'", con);
                        lblJobsDone.Text = cmd.ExecuteScalar().ToString();
                    }
                    else
                    {
                        Response.Redirect("Professionals.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            Response.Redirect("Booking.aspx?id=" + id);
        }
    }
}
