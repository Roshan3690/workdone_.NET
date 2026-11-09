using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace workdone.Professional
{
    public partial class Dashboard : System.Web.UI.Page
    {

        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select
        string ststus = " ";

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["professional"] != null)
            {
                getcon();
                if (!IsPostBack)
                {
                    cmd = new SqlCommand("select Pid, fname, lname from profesonalTBL where email = '" + Session["professional"].ToString() + "'", con);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            ViewState["Pid"] = dr["Pid"].ToString();
                            lblPartnerName.Text = dr["fname"].ToString() + " " + dr["lname"].ToString();
                        }
                    }

                    if (ViewState["Pid"] != null)
                    {
                        filldatalist();
                    }
                    
                }
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }

        void filldatalist()
        {
            getcon();
            da = new SqlDataAdapter("select * from bookingTBL where pro_id = '" + ViewState["Pid"] + "' order by booking_Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();

            cmd = new SqlCommand("select count(*) from bookingTBL where pro_id = '" + ViewState["Pid"] + "' and status = 'Pending'", con);
            lblPendingStat.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(*) from bookingTBL where pro_id = '" + ViewState["Pid"] + "' and status = 'Accepted'", con);
            int acceptedCount = Convert.ToInt32(cmd.ExecuteScalar());
            lblCompletedStat.Text = acceptedCount.ToString();
            lblEarnings.Text = "₹" + (acceptedCount * 499).ToString("N0");
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmdaccept")
            {
                getcon();
                cmd = new SqlCommand("update bookingTBL set status = 'Accepted' where booking_Id = '" + id + "'", con);
                cmd.ExecuteNonQuery();
                filldatalist();
            }
            else if (e.CommandName == "cmdreject")
            {
                getcon();
                cmd = new SqlCommand("update bookingTBL set status = 'Rejected' where booking_Id = '" + id + "'", con);
                cmd.ExecuteNonQuery();
                filldatalist();
            }

        }
    }
}
