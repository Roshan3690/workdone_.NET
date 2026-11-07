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
                    cmd = new SqlCommand("select Pid from profesonalTBL where email = '" + Session["professional"].ToString() + "'", con);
                    object pid = cmd.ExecuteScalar();

                    
                    if (pid != null)
                    {
                        ViewState["Pid"] = pid.ToString();
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
            da = new SqlDataAdapter("select * from bookingTBL where pro_id = '" + ViewState["Pid"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();

            
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
