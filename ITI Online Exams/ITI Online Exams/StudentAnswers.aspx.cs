using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITI_Online_Exams
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_display_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineExamsProjectDBConnectionString"].ToString());
            SqlCommand cm = new SqlCommand();
            cm.CommandType = CommandType.StoredProcedure;
            cm.CommandText = "proc_GetExamStudentAnswer_ForReport";
            cm.Parameters.AddWithValue("@examId", int.Parse(DropDownList2_examid.SelectedValue));
            cm.Connection = con1;
            con1.Open();
            dr = cm.ExecuteReader();
            //GridView1.DataSource = dr;
            //GridView1.DataBind();
            con1.Close();
            Repeater1.DataSource = dr;
            
            //Repeater1.DataBind();
        }
    }
}