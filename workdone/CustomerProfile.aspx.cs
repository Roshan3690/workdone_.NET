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
        string name;

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
                    name = ds.Tables[0].Rows[0]["fname"].ToString();
                    string lname = ds.Tables[0].Rows[0]["lname"].ToString();
                    lblCustomerFullName.Text = name + " " + lname;
                    lblCustomerId.Text = ds.Tables[0].Rows[0]["Id"].ToString();
                    lblHeaderEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    if (!string.IsNullOrEmpty(name))
                    {
                        lblAvatarInitials.Text = name.Substring(0, 1).ToUpper();
                    }
                    if (!IsPostBack)
                    {
                        txtfname.Text = name;
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
                        name = ds.Tables[0].Rows[0]["fname"].ToString();
                        string lname = ds.Tables[0].Rows[0]["lname"].ToString();
                        lblCustomerFullName.Text = name + " " + lname;
                        lblCustomerId.Text = ds.Tables[0].Rows[0]["Id"].ToString();
                        lblHeaderEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                        if (!string.IsNullOrEmpty(name))
                        {
                            lblAvatarInitials.Text = name.Substring(0, 1).ToUpper();
                        }
                        if (!IsPostBack)
                        {
                            txtfname.Text = name;
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
                            if (ds.Tables[0].Rows[0]["city"] != DBNull.Value)
                            {
                                string ct = ds.Tables[0].Rows[0]["city"].ToString();
                                if (ddlCity.Items.FindByValue(ct) != null)
                                {
                                    ddlCity.SelectedValue = ct;
                                }
                            }
                            if (ds.Tables[0].Rows[0]["address"] != DBNull.Value)
                            {
                                txtAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                                if (lblDisplayAddress != null)
                                {
                                    lblDisplayAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
                                }
                            }
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

                    lblCustomerFullName.Text = txtfname.Text + " " + txtlname.Text;
                    lblAlertMessage.Text = "Profile updated successfully!";
                    pnlAlertMessage.CssClass = "alert alert-success alert-dismissible fade show rounded-3 mb-4";
                    pnlAlertMessage.Visible = true;
                }
                else
                {
                    cmd = new SqlCommand("update profesonalTBL set fname = '" + txtfname.Text + "', lname = '" + txtlname.Text + "', phone = '" + txtPhone.Text + "', gender = '" + ddlGender.SelectedValue + "', city = '" + ddlCity.SelectedValue + "', address = '" + txtAddress.Text + "' where email = '" + Session["customer"] + "'", con);
                    cmd.ExecuteNonQuery();

                    lblCustomerFullName.Text = txtfname.Text + " " + txtlname.Text;
                    if (lblDisplayAddress != null)
                    {
                        lblDisplayAddress.Text = txtAddress.Text;
                    }
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
                if (string.IsNullOrEmpty(txtCurrentPassword.Text) || string.IsNullOrEmpty(txtNewPassword.Text))
                {
                    lblPasswordAlert.Text = "Please enter both current and new password.";
                    pnlPasswordAlert.CssClass = "alert alert-danger alert-dismissible fade show rounded-3 mb-4";
                    pnlPasswordAlert.Visible = true;
                    return;
                }

                if (txtNewPassword.Text != txtConfirmPassword.Text)
                {
                    lblPasswordAlert.Text = "New password and confirm password do not match.";
                    pnlPasswordAlert.CssClass = "alert alert-danger alert-dismissible fade show rounded-3 mb-4";
                    pnlPasswordAlert.Visible = true;
                    return;
                }

                getcon();

                // Check customer password
                da = new SqlDataAdapter("select * from customerTBL where email = '" + Session["customer"] + "' and pass = '" + txtCurrentPassword.Text + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    cmd = new SqlCommand("update customerTBL set pass = '" + txtNewPassword.Text + "' where email = '" + Session["customer"] + "'", con);
                    cmd.ExecuteNonQuery();

                    lblPasswordAlert.Text = "Password updated successfully!";
                    pnlPasswordAlert.CssClass = "alert alert-success alert-dismissible fade show rounded-3 mb-4";
                    pnlPasswordAlert.Visible = true;
                    txtCurrentPassword.Text = "";
                    txtNewPassword.Text = "";
                    txtConfirmPassword.Text = "";
                }
                else
                {
                    // Check professional password
                    da = new SqlDataAdapter("select * from profesonalTBL where email = '" + Session["customer"] + "' and prof_password = '" + txtCurrentPassword.Text + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        cmd = new SqlCommand("update profesonalTBL set prof_password = '" + txtNewPassword.Text + "' where email = '" + Session["customer"] + "'", con);
                        cmd.ExecuteNonQuery();

                        lblPasswordAlert.Text = "Password updated successfully!";
                        pnlPasswordAlert.CssClass = "alert alert-success alert-dismissible fade show rounded-3 mb-4";
                        pnlPasswordAlert.Visible = true;
                        txtCurrentPassword.Text = "";
                        txtNewPassword.Text = "";
                        txtConfirmPassword.Text = "";
                    }
                    else
                    {
                        lblPasswordAlert.Text = "Current password is incorrect.";
                        pnlPasswordAlert.CssClass = "alert alert-danger alert-dismissible fade show rounded-3 mb-4";
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
