using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;//For Connection
using System.Data;//For Dataset
using System.Configuration;//For Connection String

namespace workdone
{
    public partial class admin : System.Web.UI.Page
    {
        SqlConnection con;//for database connection
        SqlCommand cmd;//for sql command
        SqlDataAdapter da;//for data adapter
        DataSet ds;//for select

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

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

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fillgride();
        }

        //void filldata()
        //{
        //    getcon();

        //    da = new SqlDataAdapter(
        //        "SELECT * FROM customerTBL WHERE Id = '" + ViewState["id"] + "'",
        //        con);

        //    ds = new DataSet();
        //    da.Fill(ds);

        //    txtfname.Text = ds.Tables[0].Rows[0][1].ToString();
        //    txtlname.Text = ds.Tables[0].Rows[0][2].ToString();
        //    txtEmail.Text = ds.Tables[0].Rows[0][3].ToString();
        //    ddlGender.Text = ds.Tables[0].Rows[0][4].ToString();
        //    txtPhone.Text = ds.Tables[0].Rows[0][5].ToString();
        //    txtAddress.Text = ds.Tables[0].Rows[0][6].ToString();
        //    //txtpass.Text = ds.Tables[0].Rows[0][7].ToString();    
        //}
    }
}