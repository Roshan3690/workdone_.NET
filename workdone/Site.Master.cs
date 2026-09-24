using System;
using System.Configuration;
using System.Data.SqlClient;

namespace workdone
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected string UserName = "User";
        protected bool IsProfessional = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customer"] != null)
            {
                string email = Session["customer"].ToString();
                string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    
                    // Check if customer
                    using (SqlCommand cmd = new SqlCommand("SELECT fname, lname FROM customerTBL WHERE email = @email", con))
                    {
                        cmd.Parameters.AddWithValue("@email", email);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                UserName = dr["fname"].ToString() + " " + dr["lname"].ToString();
                                IsProfessional = false;
                            }
                        }
                    }

                    // If not customer, check if professional
                    if (UserName == "User")
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT fname, lname FROM profesonalTBL WHERE email = @email", con))
                        {
                            cmd.Parameters.AddWithValue("@email", email);
                            using (SqlDataReader dr = cmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    UserName = dr["fname"].ToString() + " " + dr["lname"].ToString();
                                    IsProfessional = true;
                                }
                            }
                        }
                    }
                    
                    if (UserName == "User")
                    {
                        UserName = email.Split('@')[0];
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
