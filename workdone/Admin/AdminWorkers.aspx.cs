using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace workdone.Admin
{
    public partial class AdminWorkers : System.Web.UI.Page
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
                loadFilterDropdowns();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void loadFilterDropdowns()
        {
            getcon();
            da = new SqlDataAdapter("SELECT DISTINCT service FROM profesonalTBL WHERE service IS NOT NULL AND service <> ''", con);
            DataSet sDs = new DataSet();
            da.Fill(sDs);
            foreach (DataRow r in sDs.Tables[0].Rows)
            {
                string sVal = r["service"].ToString().Trim();
                if (!string.IsNullOrEmpty(sVal))
                {
                    ddlServiceFilter.Items.Add(new ListItem(sVal, sVal));
                }
            }

            da = new SqlDataAdapter("SELECT DISTINCT city FROM profesonalTBL WHERE city IS NOT NULL AND city <> ''", con);
            DataSet cDs = new DataSet();
            da.Fill(cDs);
            foreach (DataRow r in cDs.Tables[0].Rows)
            {
                string cVal = r["city"].ToString().Trim();
                if (!string.IsNullOrEmpty(cVal))
                {
                    ddlCityFilter.Items.Add(new ListItem(cVal, cVal));
                }
            }
        }

        void fillgride()
        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM profesonalTBL", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            lblTotalWorkers.Text = ds.Tables[0].Rows.Count.ToString();
            lblTotalBadge.Text = "Total: " + ds.Tables[0].Rows.Count + " Professionals";

            System.Collections.Generic.HashSet<string> sSet = new System.Collections.Generic.HashSet<string>(StringComparer.OrdinalIgnoreCase);
            System.Collections.Generic.HashSet<string> cSet = new System.Collections.Generic.HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                if (r["service"] != DBNull.Value && !string.IsNullOrWhiteSpace(r["service"].ToString()))
                    sSet.Add(r["service"].ToString().Trim());
                if (r["city"] != DBNull.Value && !string.IsNullOrWhiteSpace(r["city"].ToString()))
                    cSet.Add(r["city"].ToString().Trim());
            }
            lblTotalServices.Text = sSet.Count.ToString();
            lblTotalCities.Text = cSet.Count.ToString();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            getcon();
            string q = "SELECT * FROM profesonalTBL WHERE 1=1";

            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                q += " AND (fname LIKE '%" + txtSearch.Text.Trim() + "%' OR lname LIKE '%" + txtSearch.Text.Trim() + "%' OR service LIKE '%" + txtSearch.Text.Trim() + "%' OR city LIKE '%" + txtSearch.Text.Trim() + "%')";
            }

            if (ddlServiceFilter.SelectedValue != "all" && !string.IsNullOrEmpty(ddlServiceFilter.SelectedValue))
            {
                q += " AND service = '" + ddlServiceFilter.SelectedValue + "'";
            }

            if (ddlCityFilter.SelectedValue != "all" && !string.IsNullOrEmpty(ddlCityFilter.SelectedValue))
            {
                q += " AND city = '" + ddlCityFilter.SelectedValue + "'";
            }

            da = new SqlDataAdapter(q, con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            lblTotalWorkers.Text = ds.Tables[0].Rows.Count.ToString();
            lblTotalBadge.Text = "Total: " + ds.Tables[0].Rows.Count + " Professionals";

            System.Collections.Generic.HashSet<string> sSet = new System.Collections.Generic.HashSet<string>(StringComparer.OrdinalIgnoreCase);
            System.Collections.Generic.HashSet<string> cSet = new System.Collections.Generic.HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                if (r["service"] != DBNull.Value && !string.IsNullOrWhiteSpace(r["service"].ToString()))
                    sSet.Add(r["service"].ToString().Trim());
                if (r["city"] != DBNull.Value && !string.IsNullOrWhiteSpace(r["city"].ToString()))
                    cSet.Add(r["city"].ToString().Trim());
            }
            lblTotalServices.Text = sSet.Count.ToString();
            lblTotalCities.Text = cSet.Count.ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_dlt")
            {
                getcon();
                cmd = new SqlCommand("DELETE FROM profesonalTBL WHERE Id = '" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillgride();
            }
        }
    }
}
