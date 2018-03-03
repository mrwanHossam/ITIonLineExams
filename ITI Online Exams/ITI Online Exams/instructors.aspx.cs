using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITI_Online_Exams
{
    public partial class instructors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show_departments();
                show_instructors();
            }
        }
        public void show_departments()
        {
            OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
            List<Department> all_departments = _container.Departments.ToList();
            ddl_department.DataSource = all_departments;
            ddl_department.DataBind();
        }
        public void show_instructors()
        {
            OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
            List<Instructor> allinstructors = _container.Instructors.ToList();
            grd_instructors.DataSource = allinstructors;
            grd_instructors.DataBind();
        }

        protected void btn_save_instructor_Click(object sender, EventArgs e)
        {
            if (btn_save_instructor.Text == "Save")
            {
                Instructor new_instructor = new Instructor();
                new_instructor.Ins_Name = txt_ins_name.Text;
                new_instructor.Ins_Id = int.Parse(txt_ins_id.Text);
                new_instructor.Ins_Degree = txt_ins_degree.Text;
                new_instructor.Salary = int.Parse(txt_ins_salary.Text);
                new_instructor.Dept_Id = int.Parse(ddl_department.SelectedValue);

                OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
                _container.Instructors.Add(new_instructor);
                _container.SaveChanges();

                show_departments();
                show_instructors();
                clear_ins();
            }
            else
            {
                int Instructor_Id = int.Parse(Instructor_Hidden_id.Value);
                OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
                Instructor Instructor_update = _container.Instructors.Where(a => a.Ins_Id == Instructor_Id).FirstOrDefault();
                Instructor_update.Ins_Id = int.Parse(txt_ins_id.Text);
                Instructor_update.Ins_Name = txt_ins_name.Text;
                Instructor_update.Ins_Degree = txt_ins_degree.Text;
                Instructor_update.Salary = int.Parse(txt_ins_salary.Text);
                Instructor_update.Dept_Id = int.Parse(ddl_department.SelectedValue);

                _container.SaveChanges();
                show_instructors();
                clear_ins();
                btn_save_instructor.Text = "Save";
            }
        }
        public void clear_ins()
        {
            txt_ins_name.Text = string.Empty;
            txt_ins_id.Text = string.Empty;
            txt_ins_salary.Text = string.Empty;
            txt_ins_degree.Text = string.Empty;
        }

        protected void grd_instructors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int _InstructorId = int.Parse(e.CommandArgument.ToString());
            string _actionName = e.CommandName;
            if (_actionName == "DeleteInstructor")
            {
                OnlineExamsProjectDBEntities _context = new OnlineExamsProjectDBEntities();
                Instructor _Instructor = _context.Instructors.Where(a => a.Ins_Id == _InstructorId).FirstOrDefault();
            if(_Instructor.Ins_Course.Count == 0)
                {
                    _context.Instructors.Remove(_Instructor);
                    _context.SaveChanges();
                    show_instructors();
                }
            else
                {
                    lbl_msg_instructor.Text = "instructor" + _Instructor.Ins_Name + "can't be deleted";
                }
               
            }
            else if (_actionName == "EditCurrentInstructor")
            {
                OnlineExamsProjectDBEntities _context = new OnlineExamsProjectDBEntities();
                Instructor _Instructor = _context.Instructors.Where(a => a.Ins_Id == _InstructorId).FirstOrDefault();
                txt_ins_id.Text = _Instructor.Ins_Id.ToString();
                txt_ins_name.Text = _Instructor.Ins_Name;
                txt_ins_degree.Text = _Instructor.Ins_Degree;
                txt_ins_salary.Text = _Instructor.Salary.ToString();
                ddl_department.SelectedValue = _Instructor.Dept_Id.ToString();
                btn_save_instructor.Text = "Update";
                Instructor_Hidden_id.Value = _InstructorId.ToString();
            }
        }
    }
}