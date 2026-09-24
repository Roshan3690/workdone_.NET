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
            getcon();
            fillgride();
            
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
        }

        void filldata()
        {
            getcon();

            da = new SqlDataAdapter(
                "SELECT * FROM customerTBL WHERE Id = '" + ViewState["id"] + "'",
                con);

            ds = new DataSet();
            da.Fill(ds);

            txtfname.Text = ds.Tables[0].Rows[0][1].ToString();
            txtlname.Text = ds.Tables[0].Rows[0][2].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0][3].ToString();
            ddlGender.Text = ds.Tables[0].Rows[0][4].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0][5].ToString();
            txtAddress.Text = ds.Tables[0].Rows[0][6].ToString();
            //txtpass.Text = ds.Tables[0].Rows[0][7].ToString();    
        }




        protected void Button1_Click(object sender, EventArgs e)
        {

            string fname = txtfname.Text;
            string lname = txtlname.Text;
            string email = txtEmail.Text;
            string gender = ddlGender.SelectedValue;
            string phone = txtPhone.Text;
            string password = txtpass.Text;

            //if (fname != "" && lname != "" && email != "" && phone != "" && password != "")
            if (Button1.Text == "Create Account")
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

                Response.Redirect("Login.aspx");

            }
            else if (Button1.Text == "Update")
            {
                getcon();

                cmd = new SqlCommand("UPDATE customerTBL SET " +
                    "fname='" + txtfname.Text + "'," +
                    "lname='" + txtlname.Text + "'," +
                    "email='" + txtEmail.Text + "'," +
                    "gender='" + ddlGender.SelectedValue + "'," +
                    "phone='" + txtPhone.Text + "'," +
                    "pass='" + txtpass.Text + "' " +
                    "WHERE Id='" + ViewState["id"] + "'", con);

                cmd.ExecuteNonQuery();
                fillgride();
            }
            else
            {
                Label1.Text = "Fill all the filds";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                ViewState["id"] = id;

                Button1.Text = "Update";

                filldata();
            }
            else
            {
                getcon();

                cmd = new SqlCommand("DELETE FROM customerTBL WHERE Id = '" + e.CommandArgument + "'", con);

                cmd.ExecuteNonQuery();

                fillgride();
            }
        }
    }
}
