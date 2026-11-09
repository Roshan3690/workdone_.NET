using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace workdone
{
    public partial class Default : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillFeaturedPros();
            }
        }

        void fillFeaturedPros()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 3 * FROM profesonalTBL ORDER BY Pid DESC", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                rptFeaturedPros.DataSource = ds;
                rptFeaturedPros.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtHeroSearch.Text.Trim();
            string city = ddlHeroCity.SelectedValue;
            string url = "Professionals.aspx?";
            if (!string.IsNullOrEmpty(search)) url += "search=" + Server.UrlEncode(search) + "&";
            if (!string.IsNullOrEmpty(city)) url += "city=" + Server.UrlEncode(city);
            Response.Redirect(url.TrimEnd('&', '?'));
        }
    }
}
