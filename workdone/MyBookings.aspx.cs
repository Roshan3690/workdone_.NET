using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Xml.Linq;

namespace workdone
{
    public partial class MyBookings : Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select


        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customer"] != null)
            {
                getcon();

                filldatalist();
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

        void filldatalist()
        {
            getcon();
            da = new SqlDataAdapter("select b.*, " +
               "p.fname as fname, " +
               "p.lname as lname, " +
               "p.service ," +
               "p.phone " + 
               "from bookingTBL b " +
               "left join profesonalTBL p on b.pro_id = p.Pid " +
               "where b.email = '" + Session["customer"].ToString() + "' " +
               "order by b.booking_Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }
    }
}
