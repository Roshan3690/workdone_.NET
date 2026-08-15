using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace workdone
{
    public partial class JoinProfessional : System.Web.UI.Page
    {
        SqlConnection con;//for database connection
        SqlCommand cmd;//for sql command
        SqlDataAdapter da;//for data adapter
        DataSet ds;//for select

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;//for connection string
        string fnm;//for image path

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void imgupload()
        {
            fnm = "image/" + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(fnm));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fname = txtProfessionalFirstName.Text;
            string lname = txtProfessionalLastName.Text;
            string email = txtProfessionalEmail.Text;
            string phone = txtProfessionalPhone.Text;
            string city = ddlProfessionalCity.SelectedValue;
            string service = ddlProfessionalService.SelectedValue;
            string experience = txtProfessionalExperience.Text;
            string gender = ddlProfessionalGender.SelectedValue;
            string address = txtProfessionalAddress.Text;
            string aadhaarId = txtProfessionalAadhaarId.Text;


            if (!string.IsNullOrEmpty(fname) && !string.IsNullOrEmpty(lname) && !string.IsNullOrEmpty(email)
                && !string.IsNullOrEmpty(phone) && !string.IsNullOrEmpty(city) && !string.IsNullOrEmpty(service)
                && !string.IsNullOrEmpty(experience) && !string.IsNullOrEmpty(gender)
                && !string.IsNullOrEmpty(address) && !string.IsNullOrEmpty(aadhaarId))
            {
                getcon();
                imgupload();
                cmd = new SqlCommand("insert into profesonalTBL values('" + fname + "','" + lname + "','" + phone + "','" + city + "','" + service + "','" + experience + "','" + email + "','" + gender + "','" + address + "','" + fnm + "','" + aadhaarId + "')", con);
                
                //cmd = new SqlCommand("INSERT INTO profesonalTBL (fname, lname, phone, city, service, experience, email, Gender, address, pic, addhar_id) VALUES (@fname, @lname, @phone, @city, @service, @experience, @email, @gender, @address, @fnm, @aadhaarId)",con);

                //cmd.Parameters.AddWithValue("@fname", fname);
                //cmd.Parameters.AddWithValue("@lname", lname);
                //cmd.Parameters.AddWithValue("@phone", phone);
                //cmd.Parameters.AddWithValue("@city", city);
                //cmd.Parameters.AddWithValue("@service", service);
                //cmd.Parameters.AddWithValue("@experience", experience);
                //cmd.Parameters.AddWithValue("@email", email);
                //cmd.Parameters.AddWithValue("@gender", gender);
                //cmd.Parameters.AddWithValue("@address", address);
                //cmd.Parameters.AddWithValue("@fnm", fnm);
                //cmd.Parameters.AddWithValue("@aadhaarId", aadhaarId);
                cmd.ExecuteNonQuery();

                Response.Redirect("Default.aspx");
            }
            else
            {
                Label1.Text = "Please fill all required professional fields.";
            }
        }
    }
}
