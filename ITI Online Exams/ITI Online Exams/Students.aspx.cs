using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITI_Online_Exams
{
	public partial class Students : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show_students();
                show_departments();
            }
        }
        public void show_students()
        {
            OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
            List<Student> all_students = _container.Students.ToList();
            grd_students.DataSource = all_students;
            grd_students.DataBind();
        }
        public void show_departments()
        {
            OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
            List<Department> all_departments = _container.Departments.ToList();
            ddl_dept.DataSource = all_departments;
            ddl_dept.DataBind();
        }
        public void clear_values()
        {
            txt_fname.Text = string.Empty;
            txt_lname.Text = string.Empty;
            txt_address.Text = string.Empty;
            txt_age.Text = string.Empty;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            
            if (btn_save.Text == "Save")
            {
                Student new_student = new Student();
                new_student.St_Fname = txt_fname.Text;
                new_student.St_Lname = txt_lname.Text;
                new_student.St_Address = txt_address.Text;
                new_student.St_Age = int.Parse(txt_age.Text);
                new_student.Dept_Id = int.Parse(ddl_dept.SelectedValue);

                //add to DB that object
                OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
                _container.Students.Add(new_student);
                _container.SaveChanges();

                //to add reload grid view by new data inserted from DB
                show_students();
                show_departments();
                clear_values();
            }
            else
            {
                int student_Id = int.Parse(st_hidden_id.Value);
                OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
                Student stu_update = _container.Students.Where(a => a.St_Id == student_Id).FirstOrDefault();
                stu_update.St_Fname = txt_fname.Text;
                stu_update.St_Lname = txt_lname.Text;
                stu_update.St_Age = int.Parse(txt_age.Text);
                stu_update.St_Address = txt_address.Text;

                _container.SaveChanges();
                show_students();
                clear_values();
                btn_save.Text = "Save";
            }
        }

        protected void grd_students_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int _studentId = int.Parse(e.CommandArgument.ToString());
            string _actionName = e.CommandName;
            if (_actionName == "DeleteStudent")
            {
                OnlineExamsProjectDBEntities _context = new OnlineExamsProjectDBEntities();
                Student _student = _context.Students.Where(a => a.St_Id == _studentId).FirstOrDefault();
                if (_student.Exams.Count == 0 && _student.Stud_Course.Count == 0)
                {
                    _context.Students.Remove(_student);
                    _context.SaveChanges();
                    show_students();
                    lbl_meesage.Text = "";
                }
                else
                {
                    lbl_meesage.Text = "Student " + _student.St_Fname + " Can't be deleted !";
                }
            }
            else if (_actionName == "EditCurrentStudent")
            {
                OnlineExamsProjectDBEntities _context = new OnlineExamsProjectDBEntities();
                Student _student = _context.Students.Where(a => a.St_Id == _studentId).FirstOrDefault();
                txt_fname.Text = _student.St_Fname;
                txt_lname.Text = _student.St_Lname;
                txt_age.Text = _student.St_Age.ToString();
                txt_address.Text = _student.St_Address;
                ddl_dept.SelectedValue = _student.Dept_Id.ToString();
                btn_save.Text = "Update";
                st_hidden_id.Value = _studentId.ToString();
            }


        }
    }
}