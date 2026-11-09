using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace workdone.Admin
{
    public partial class AdminWorkers : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (!IsPostBack)
            {
                fillgride();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgride()
        {
            getcon();
            string query = "Select * from profesonalTBL where 1=1";

            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                query += " and (fname like '%" + txtSearch.Text.Trim() + "%' or lname like '%" + txtSearch.Text.Trim() + "%' or service like '%" + txtSearch.Text.Trim() + "%')";
            }

            if (!string.IsNullOrEmpty(ddlServiceFilter.SelectedValue) && ddlServiceFilter.SelectedValue != "all")
            {
                query += " and service = '" + ddlServiceFilter.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(ddlCityFilter.SelectedValue) && ddlCityFilter.SelectedValue != "all")
            {
                query += " and city = '" + ddlCityFilter.SelectedValue + "'";
            }

            query += " order by Pid desc";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            lblTotalBadge.Text = "Total: " + ds.Tables[0].Rows.Count + " Professionals";

            cmd = new SqlCommand("Select count(*) from profesonalTBL", con);
            lblTotalWorkers.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("Select count(distinct service) from profesonalTBL", con);
            lblTotalServices.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("Select count(distinct city) from profesonalTBL", con);
            lblTotalCities.Text = cmd.ExecuteScalar().ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_dlt")
            {
                getcon();
                cmd = new SqlCommand("delete from profesonalTBL where Pid = '" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();

                lblAlertMessage.Text = "Professional #" + e.CommandArgument + " deleted successfully.";
                pnlAlert.Visible = true;

                fillgride();
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            fillgride();
        }
    }
}
