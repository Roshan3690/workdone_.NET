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
            string email = null;
            if (Session["customer"] != null)
            {
                email = Session["customer"].ToString();
                IsProfessional = false;
            }
            else if (Session["professional"] != null)
            {
                email = Session["professional"].ToString();
                IsProfessional = true;
            }

            if (!string.IsNullOrEmpty(email))
            {
                string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
                
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    
                    if (!IsProfessional)
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT fname, lname FROM customerTBL WHERE email = @email", con))
                        {
                            cmd.Parameters.AddWithValue("@email", email);
                            using (SqlDataReader dr = cmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    UserName = dr["fname"].ToString() + " " + dr["lname"].ToString();
                                }
                            }
                        }
                    }
                    else
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT fname, lname FROM profesonalTBL WHERE email = @email", con))
                        {
                            cmd.Parameters.AddWithValue("@email", email);
                            using (SqlDataReader dr = cmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    UserName = dr["fname"].ToString() + " " + dr["lname"].ToString();
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
