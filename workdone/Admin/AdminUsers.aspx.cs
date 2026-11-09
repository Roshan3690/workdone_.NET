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
    public partial class AdminUsers : System.Web.UI.Page
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
            string query = "Select * from customerTBL where 1=1";

            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                query += " and (fname like '%" + txtSearch.Text.Trim() + "%' or lname like '%" + txtSearch.Text.Trim() + "%' or email like '%" + txtSearch.Text.Trim() + "%' or phone like '%" + txtSearch.Text.Trim() + "%')";
            }

            if (!string.IsNullOrEmpty(ddlGenderFilter.SelectedValue) && ddlGenderFilter.SelectedValue != "all")
            {
                query += " and gender = '" + ddlGenderFilter.SelectedValue + "'";
            }

            query += " order by Cid desc";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            lblTotalBadge.Text = "Total: " + ds.Tables[0].Rows.Count + " Customers";

            cmd = new SqlCommand("Select count(*) from customerTBL", con);
            lblTotalCustomers.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("Select count(*) from customerTBL where gender = 'Male'", con);
            lblMaleCount.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("Select count(*) from customerTBL where gender = 'Female'", con);
            lblFemaleCount.Text = cmd.ExecuteScalar().ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_dlt")
            {
                getcon();
                cmd = new SqlCommand("delete from customerTBL where Cid = '" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();

                lblAlertMessage.Text = "Customer #" + e.CommandArgument + " deleted successfully.";
                pnlAlert.Visible = true;

                fillgride();
            }
        }

        protected void btnSearchCustomer_Click(object sender, EventArgs e)
        {
            fillgride();
        }

            
    }
}