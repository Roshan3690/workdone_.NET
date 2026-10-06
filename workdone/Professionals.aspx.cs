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
    public partial class Professionals : System.Web.UI.Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (Session["customer"] != null)
            {
                getcon();

                da = new SqlDataAdapter("select * from customerTBL where email = '" + Session["customer"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

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
            da = new SqlDataAdapter("select * from profesonalTBL", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view_profile")
            {
                int pro_id = Convert.ToInt16(e.CommandArgument);
                ViewState["pid"] = pro_id;
                Response.Redirect("ProfessionalProfile.aspx?pro_id=" + ViewState["pro_id"]);
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
