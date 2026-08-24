using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;
namespace workdone
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;//for database connection
        SqlCommand cmd;//for sql command
        SqlDataAdapter da;//for data adapter
        DataSet ds;//for select

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string fname = txtfname.Text;
            string lname = txtlname.Text;
            string email = txtEmail.Text;
            string gender = ddlGender.SelectedValue;
            string phone = txtPhone.Text;
            string password = txtpass.Text;

            if (fname != "" && lname != "" && email != "" && phone != "" && password != "")
            {
                getcon();
                cmd = new SqlCommand("INSERT INTO customerTBL (fname, lname, email, gender, phone, pass) VALUES (@fname, @lname, @email, @gender, @phone, @pass)", con);

                cmd.Parameters.AddWithValue("@fname", fname);
                cmd.Parameters.AddWithValue("@lname", lname);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@pass", password);

                cmd.ExecuteNonQuery();

                Response.Redirect("Default.aspx");
            }
            else
            {
                Label1.Text = "Fill all the filds";

            }
        }
    }
}
