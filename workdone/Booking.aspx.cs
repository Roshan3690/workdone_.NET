using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace workdone
{
    public partial class Booking : System.Web.UI.Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select

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

                    if (Request.QueryString["id"] != null)
                    {
                        string pid = Request.QueryString["id"];
                        ViewState["Pid"] = pid;

                        cmd = new SqlCommand("select * from profesonalTBL where Pid='" + pid + "'", con);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            lblservice.Text = ds.Tables[0].Rows[0]["service"].ToString();
                        }

                        cmd = new SqlCommand("select * from customerTBL where email='" + Session["customer"].ToString() + "'", con);
                        da = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            ViewState["Cid"] = ds.Tables[0].Rows[0]["Cid"].ToString();
                            txtName.Text = ds.Tables[0].Rows[0]["fname"].ToString() + " " +
                             ds.Tables[0].Rows[0]["lname"].ToString();

                            txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                            txtPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                        }
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnbooking_Click(object sender, EventArgs e)
        {
            string Service = lblservice.Text;
            string Describe = txtDescription.Text;
            string booktime = txtDate.Text;
            string time = ddlTime.Text;
            string duretion = ddlDuration.Text;
            string fname = txtName.Text;
            string mbl = txtPhone.Text;
            string eml = txtEmail.Text;
            string address = txtAddress.Text;



            if (!string.IsNullOrEmpty(Service) && !string.IsNullOrEmpty(Describe) && !string.IsNullOrEmpty(booktime)
                && !string.IsNullOrEmpty(time) && !string.IsNullOrEmpty(duretion) && !string.IsNullOrEmpty(fname)
                && !string.IsNullOrEmpty(mbl) && !string.IsNullOrEmpty(eml)
                && !string.IsNullOrEmpty(address))
            {
                getcon();
                SqlCommand cmd = new SqlCommand("insert into bookingTBL (cus_id, pro_id, service, description, booking_date, booking_time, duration, name, phone, email, address, status) values ('" +
                    ViewState["Cid"] + "','" +
                    ViewState["Pid"] + "','" +
                    lblservice.Text + "','" +
                    txtDescription.Text + "','" +
                    txtDate.Text + "','" +
                    ddlTime.SelectedValue + "','" +
                    ddlDuration.SelectedValue + "','" +
                    txtName.Text + "','" +
                    txtPhone.Text + "','" +
                    txtEmail.Text + "','" +
                    txtAddress.Text + "'," +
                    "'" + "Pending" + "')", con);

                cmd.ExecuteNonQuery();

                Label1.Text = "Request sent successfully!";
                Response.Redirect("CustomerProfile.aspx");
            }
            else
            {
                Label1.Text = "Please fill all required  fields.";
            }

        }
    }
}
