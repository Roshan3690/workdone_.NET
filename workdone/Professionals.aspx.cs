using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace workdone
{
    public partial class Professionals : System.Web.UI.Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;//For Connection String

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["customer"] != null)
            {
                
                
                    filldatalist();
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        void filldatalist()
        {
            getcon();
            string query = "select * from profesonalTBL where 1=1";
            if (Request.QueryString["service"] != null && !string.IsNullOrEmpty(Request.QueryString["service"]))
            {
                query += " and service = '" + Request.QueryString["service"] + "'";
            }

            if (Request.QueryString["search"] != null && !string.IsNullOrEmpty(Request.QueryString["search"]))
            {
                query += " and (fname like '%" + Request.QueryString["search"].Trim() + "%' or lname like '%" + Request.QueryString["search"].Trim() + "%' or service like '%" + Request.QueryString["search"].Trim() + "%')";
                txtSearch.Text = Request.QueryString["search"];
            }

            if (Request.QueryString["city"] != null && !string.IsNullOrEmpty(Request.QueryString["city"]))
            {
                query += " and city = '" + Request.QueryString["city"] + "'";
                if (ddlCity.Items.FindByValue(Request.QueryString["city"]) != null)
                {
                    ddlCity.SelectedValue = Request.QueryString["city"];
                }
            }

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            lblCount.Text = ds.Tables[0].Rows.Count.ToString();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblNoData.Visible = false;
                DataList1.Visible = true;
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            else
            {
                lblNoData.Visible = true;
                DataList1.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getcon();
            string query = "select * from profesonalTBL where 1=1";

            if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
            {
                query += " and (fname like '%" + txtSearch.Text.Trim() + "%' or lname like '%" + txtSearch.Text.Trim() + "%' or service like '%" + txtSearch.Text.Trim() + "%')";
            }

            if (!string.IsNullOrEmpty(ddlCity.SelectedValue))
            {
                query += " and city = '" + ddlCity.SelectedValue + "'";
            }

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            lblCount.Text = ds.Tables[0].Rows.Count.ToString();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblNoData.Visible = false;
                DataList1.Visible = true;
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            else
            {
                lblNoData.Visible = true;
                DataList1.Visible = false;
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_profile")
            {
                Response.Redirect("ProfessionalProfile.aspx?id=" + id);
            }
            else if (e.CommandName == "cmd_book")
            {
                Response.Redirect("Booking.aspx?id=" + id);
            }
        }
    }
}


