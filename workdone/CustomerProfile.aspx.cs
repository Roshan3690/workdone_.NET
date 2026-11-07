using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace workdone
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        SqlConnection con;//For Connection
        SqlCommand cmd;//For insert, update, delete
        SqlDataAdapter da;//For Container
        DataSet ds;//For Select

        string fname;
        string lname;

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
                getcon();

                da = new SqlDataAdapter("select * from customerTBL where email = '" + Session["customer"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    fname = ds.Tables[0].Rows[0]["fname"].ToString();
                    lname = ds.Tables[0].Rows[0]["lname"].ToString();
                    lblcname.Text = fname + " " + lname;
                    lblcid.Text = ds.Tables[0].Rows[0]["Cid"].ToString();
                    lbleml.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    if (!string.IsNullOrEmpty(fname))
                    {
                        lblAvatar.Text = fname.Substring(0, 1).ToUpper();
                    }
                    if (!IsPostBack)
                    {
                        txtfname.Text = fname;
                        txtlname.Text = lname;
                        txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                        txtPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                        if (ds.Tables[0].Rows[0]["gender"] != DBNull.Value)
                        {
                            string gen = ds.Tables[0].Rows[0]["gender"].ToString();
                            if (ddlGender.Items.FindByValue(gen) != null)
                            {
                                ddlGender.SelectedValue = gen;
                            }
                        }
                    }
                }
                else
                {
                    da = new SqlDataAdapter("select * from profesonalTBL where email = '" + Session["customer"] + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        fname = ds.Tables[0].Rows[0]["fname"].ToString();
                        lname = ds.Tables[0].Rows[0]["lname"].ToString();
                        lblcname.Text = fname + " " + lname;
                        lblcid.Text = ds.Tables[0].Rows[0]["Pid"].ToString();
                        lbleml.Text = ds.Tables[0].Rows[0]["email"].ToString();
                        if (!string.IsNullOrEmpty(fname))
                        {
                            lblAvatar.Text = fname.Substring(0, 1).ToUpper();
                        }
                        if (!IsPostBack)
                        {
                            txtfname.Text = fname;
                            txtlname.Text = lname;
                            txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                            txtPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
                            ddlGender.SelectedValue = ds.Tables[0].Rows[0]["gender"].ToString();
                            ddlCity.SelectedValue = ds.Tables[0].Rows[0]["city"].ToString();

                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            if (Session["customer"] != null)
            {
                getcon();

                da = new SqlDataAdapter("select * from customerTBL where email = '" + Session["customer"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    cmd = new SqlCommand("update customerTBL set fname = '" + txtfname.Text + "', lname = '" + txtlname.Text + "', phone = '" + txtPhone.Text + "', gender = '" + ddlGender.SelectedValue + "' where email = '" + Session["customer"] + "'", con);
                    cmd.ExecuteNonQuery();

                    lblcname.Text = txtfname.Text + " " + txtlname.Text;
                    lblAlertMessage.Text = "Profile updated successfully!";
                    pnlAlertMessage.CssClass = "alert alert-success alert-dismissible fade show rounded-3 mb-4";
                    pnlAlertMessage.Visible = true;
                }
                else
                {
                    cmd = new SqlCommand("update profesonalTBL set fname = '" + txtfname.Text + "', lname = '" + txtlname.Text + "', phone = '" + txtPhone.Text + "', gender = '" + ddlGender.SelectedValue + "', city = '" + ddlCity.SelectedValue + "' where email = '" + Session["customer"] + "'", con);
                    cmd.ExecuteNonQuery();

                    lblcname.Text = txtfname.Text + " " + txtlname.Text;
                    lblAlertMessage.Text = "Professional profile updated successfully!";
                    pnlAlertMessage.CssClass = "alert alert-success alert-dismissible fade show rounded-3 mb-4";
                    pnlAlertMessage.Visible = true;
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (Session["customer"] != null)
            {
                if (string.IsNullOrEmpty(txtcurrentpass.Text) || string.IsNullOrEmpty(txtnewpass.Text))
                {
                    lblpassalert.Text = "Please enter all password fields.";
                    pnlPasswordAlert.CssClass = "alert alert-danger rounded-3 mb-4";
                    pnlPasswordAlert.Visible = true;
                    return;
                }

                if (txtnewpass.Text != txtconfirmpass.Text)
                {
                    lblpassalert.Text = "New password and confirm password do not match.";
                    pnlPasswordAlert.CssClass = "alert alert-danger rounded-3 mb-4";
                    pnlPasswordAlert.Visible = true;
                    return;
                }

                getcon();


                da = new SqlDataAdapter("select * from customerTBL where email = '" + Session["customer"] + "' and pass = '" + txtcurrentpass.Text + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    cmd = new SqlCommand("update customerTBL set pass = '" + txtnewpass.Text + "' where email = '" + Session["customer"] + "'", con);
                    cmd.ExecuteNonQuery();

                    lblpassalert.Text = "Password updated successfully!";
                    pnlPasswordAlert.CssClass = "alert alert-success rounded-3 mb-4";
                    pnlPasswordAlert.Visible = true;
                    txtcurrentpass.Text = "";
                    txtnewpass.Text = "";
                    txtconfirmpass.Text = "";
                }
                else
                {

                    da = new SqlDataAdapter("select * from profesonalTBL where email = '" + Session["customer"] + "' and prof_password = '" + txtcurrentpass.Text + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        cmd = new SqlCommand("update profesonalTBL set prof_password = '" + txtnewpass.Text + "' where email = '" + Session["customer"] + "'", con);
                        cmd.ExecuteNonQuery();

                        lblpassalert.Text = "Password updated successfully!";
                        pnlPasswordAlert.CssClass = "alert alert-success rounded-3 mb-4";
                        pnlPasswordAlert.Visible = true;
                        txtcurrentpass.Text = "";
                        txtnewpass.Text = "";
                        txtconfirmpass.Text = "";
                    }
                    else
                    {
                        lblpassalert.Text = "Current password is incorrect.";
                        pnlPasswordAlert.CssClass = "alert alert-danger rounded-3 mb-4";
                        pnlPasswordAlert.Visible = true;
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}
