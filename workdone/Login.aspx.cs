using System;
using System.Security.Policy;
using System.Xml.Linq;

namespace workdone
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = TextBox1.Text;
            string password = TextBox2.Text;

            if (email !="" && password !="")
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Label1.Text = "Fill all the filds";

            }
        }
    }
}
