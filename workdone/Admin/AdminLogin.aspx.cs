using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace workdone.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
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

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtAdminEmail.Text) || string.IsNullOrEmpty(txtAdminPass.Text))
            {
                lblAdminError.Text = "Please enter email and password.";
                lblAdminError.Visible = true;
                return;
            }

            if ((txtAdminEmail.Text == "admin@workdone.com" || txtAdminEmail.Text == "admin@asp.net") && (txtAdminPass.Text == "admin123" || txtAdminPass.Text == "admin1234"))
            {
                Session["admin"] = txtAdminEmail.Text;
                Response.Redirect("AdminUsers.aspx");
                return;
            }

            getcon();
            da = new SqlDataAdapter("select * from customerTBL where email = '" + txtAdminEmail.Text + "' and pass = '" + txtAdminPass.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["admin"] = txtAdminEmail.Text;
                Response.Redirect("AdminUsers.aspx");
            }
            else
            {
                lblAdminError.Text = "Invalid Admin credentials.";
                lblAdminError.Visible = true;
            }
        }
    }
}
