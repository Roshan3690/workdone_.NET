using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace workdone.Admin
{
    public partial class AdminUsers : System.Web.UI.Page
    {
        SqlConnection con;//for database connection
        SqlCommand cmd;//for sql command
        SqlDataAdapter da;//for data adapter
        DataSet ds;//for select

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

            da = new SqlDataAdapter("SELECT * FROM customerTBL", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            lblTotalCustomers.Text = ds.Tables[0].Rows.Count.ToString();
            lblTotalBadge.Text = "Total: " + ds.Tables[0].Rows.Count + " Customers";

            int maleCount = 0;
            int femaleCount = 0;
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                string g = r["gender"] != null ? r["gender"].ToString().Trim() : "";
                if (string.Equals(g, "Male", StringComparison.OrdinalIgnoreCase)) maleCount++;
                else if (string.Equals(g, "Female", StringComparison.OrdinalIgnoreCase)) femaleCount++;
            }
            lblMaleCount.Text = maleCount.ToString();
            lblFemaleCount.Text = femaleCount.ToString();
        }

        protected void btnSearchCustomer_Click(object sender, EventArgs e)
        {
            getcon();
            string q = "SELECT * FROM customerTBL WHERE 1=1";

            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                q += " AND (fname LIKE '%" + txtSearch.Text.Trim() + "%' OR lname LIKE '%" + txtSearch.Text.Trim() + "%' OR email LIKE '%" + txtSearch.Text.Trim() + "%' OR phone LIKE '%" + txtSearch.Text.Trim() + "%')";
            }

            if (ddlGenderFilter.SelectedValue != "all" && !string.IsNullOrEmpty(ddlGenderFilter.SelectedValue))
            {
                q += " AND gender = '" + ddlGenderFilter.SelectedValue + "'";
            }

            da = new SqlDataAdapter(q, con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            lblTotalCustomers.Text = ds.Tables[0].Rows.Count.ToString();
            lblTotalBadge.Text = "Total: " + ds.Tables[0].Rows.Count + " Customers";

            int maleCount = 0;
            int femaleCount = 0;
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                string g = r["gender"] != null ? r["gender"].ToString().Trim() : "";
                if (string.Equals(g, "Male", StringComparison.OrdinalIgnoreCase)) maleCount++;
                else if (string.Equals(g, "Female", StringComparison.OrdinalIgnoreCase)) femaleCount++;
            }
            lblMaleCount.Text = maleCount.ToString();
            lblFemaleCount.Text = femaleCount.ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_dlt")
            {
                getcon();
                cmd = new SqlCommand("DELETE FROM customerTBL WHERE Id = '" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillgride();
            }
        }
    }
}