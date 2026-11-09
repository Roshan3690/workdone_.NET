using System;

using System;
using System.Configuration;
using System.Data.SqlClient;

namespace workdone
{
    public partial class Services : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillCounts();
            }
        }

        void fillCounts()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT service, COUNT(*) AS cnt FROM profesonalTBL GROUP BY service", con))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            string srv = dr["service"].ToString().ToLower();
                            int cnt = Convert.ToInt32(dr["cnt"]);
                            if (srv.Contains("cleaning")) lblHomeCleaningCount.Text = cnt + " Verified Pros";
                            else if (srv.Contains("plumb")) lblPlumbingCount.Text = cnt + " Verified Pros";
                            else if (srv.Contains("electr")) lblElectricianCount.Text = cnt + " Verified Pros";
                            else if (srv.Contains("ac")) lblACRepairCount.Text = cnt + " Verified Pros";
                            else if (srv.Contains("carpent")) lblCarpentryCount.Text = cnt + " Verified Pros";
                            else if (srv.Contains("paint")) lblPaintingCount.Text = cnt + " Verified Pros";
                            else if (srv.Contains("beauty")) lblBeautyCount.Text = cnt + " Verified Pros";
                            else if (srv.Contains("vehicle")) lblVehicleCount.Text = cnt + " Verified Pros";
                        }
                    }
                }
            }
        }
    }
}
