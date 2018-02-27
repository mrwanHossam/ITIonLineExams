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
    public partial class StudentREG : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cm;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("Data Source=.;Initial Catalog = OnlineExamsProjectDB ;Integrated Security=True");
            if (!Page.IsPostBack)
            {
                ddlstudents.Items.Add("-------------");
                cm = new SqlCommand("SELECT St_Id,St_Fname+' '+St_Lname AS NAME FROM Student WHERE St_Id NOT IN (SELECT userDataID FROM wepUsers WHERE usertype = 0)", con);
                cm.CommandType = CommandType.Text;
                con.Open();
                SqlDataReader dr = cm.ExecuteReader();
                ddlstudents.DataSource = dr;
                ddlstudents.DataTextField = "NAME";
                ddlstudents.DataValueField = "St_Id";
                ddlstudents.DataBind();
                con.Close();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (ddlstudents.SelectedIndex >-1)
            {
                string ssnid;
                cm =new SqlCommand($"SELECT SSNID FROM Student WHERE St_Id = {ddlstudents.SelectedValue}",con);
                con.Open();
                ssnid = cm.ExecuteScalar().ToString();
                con.Close();
                if (ssnid.ToString() ==txtStudentSSNID.Text)
                {
                    Response.Redirect($"Register.aspx?id={ddlstudents.SelectedValue}");
                }
                else if (ssnid.ToString() != txtStudentSSNID.Text)
                {
                    Response.Write("<script>alert('SSNID IS NOT CORRECT!');</script>");
                    txtStudentSSNID.Focus();
                }
            }
        }

        protected void ddlstudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            cm = new SqlCommand($"SELECT SSNID FROM Student WHERE St_Id = {ddlstudents.SelectedValue}", con);
            con.Open();
            lableSSN.Text = cm.ExecuteScalar().ToString();
            con.Close();
        }
    }
}