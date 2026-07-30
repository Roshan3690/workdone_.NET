using System;

namespace workdone
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fname = TextBox1.Text;
            string lname = TextBox2.Text;
            string email = TextBox3.Text;
            string phone = TextBox4.Text;
            string password = TextBox5.Text;

            if (fname != "" && lname != "" && email != "" && phone != "" && password != "")
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
