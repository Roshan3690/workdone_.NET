using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace workdone.Professional
{
    public partial class ProfessionalMaster : System.Web.UI.MasterPage
    {
        public string ProfessionalName = "Professional Partner";
        public string ProfessionalEmail = "partner@workdone.com";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if professional is logged in
            if (Session["professional"] != null)
            {
                ProfessionalEmail = Session["professional"].ToString();
                // Template display name derived from session or default
                if (Session["professional_name"] != null)
                {
                    ProfessionalName = Session["professional_name"].ToString();
                }
                else
                {
                    string username = ProfessionalEmail.Split('@')[0];
                    ProfessionalName = char.ToUpper(username[0]) + username.Substring(1);
                }
            }
        }

        public string GetInitials()
        {
            if (!string.IsNullOrEmpty(ProfessionalName))
            {
                var parts = ProfessionalName.Trim().Split(' ');
                if (parts.Length > 1 && parts[0].Length > 0 && parts[1].Length > 0)
                {
                    return (parts[0][0].ToString() + parts[1][0].ToString()).ToUpper();
                }
                return ProfessionalName.Substring(0, Math.Min(2, ProfessionalName.Length)).ToUpper();
            }
            return "PR";
        }

        protected void btnProLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("professional");
            Session.Remove("professional_name");
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}
