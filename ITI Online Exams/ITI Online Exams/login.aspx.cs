using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ITI_Online_Exams
{
    public partial class registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("Server = . ; Database = OnlineExamsProjectDB ; Integrated Security = true");
            cmd = new SqlCommand("PROC_check_user", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            cmd.Parameters.AddWithValue("@username",txtUserName.Text);
            con.Open();
            SqlDataReader red = cmd.ExecuteReader();
            string password = null;
            bool userType;
            if (red.Read())
            {
                password = red.GetString(0);
                userType = red.GetBoolean(1); 
            }
            else
            {
                userType = false;
            }
            con.Close();
            bool passwordChecked = (password == txtPassword.Text);
            if (password!=null)
            {
                if (passwordChecked && !userType )
                {
                    Response.Write("<script>alert('studint')</script>");
                    //Response.Redirect("index.aspx");
                    //here will redirect to student home page
                }
                else if (passwordChecked && userType)
                {
                    //here will redirect to admin home page 
                    Response.Write("<script>alert('admin')</script>");
                }
                else if (!passwordChecked)
                {
                    Response.Write("<script>alert('Password incorrect')</script>");
                }
            }
            else if(password == null)
            {
                Response.Write("<script>alert('UserName dos not Exists')</script>");
            }
            
        }
    }
}