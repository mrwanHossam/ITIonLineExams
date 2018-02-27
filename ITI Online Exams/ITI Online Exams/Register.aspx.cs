using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITI_Online_Exams
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cm;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("Data Source=.;Initial Catalog = OnlineExamsProjectDB ;Integrated Security=True");
            cm = new SqlCommand("",con);
            cm.CommandType = CommandType.Text;

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (txtpassword.Text==txtPasswordConfirm.Text)
            {
                cm.CommandText = $"INSERT INTO wepUsers VALUES ('{txtusername.Text}','{txtpassword.Text}',0,{Request.QueryString["id"]})";
                con.Open();
                cm.ExecuteNonQuery();
                con.Close();
                Response.Redirect("login.aspx");
            }
            else if(txtpassword.Text != txtPasswordConfirm.Text)
            {
                Response.Write("<script>alert('password dosnt match!');</script>");
                txtPasswordConfirm.Focus();
            }
        }
    }
}