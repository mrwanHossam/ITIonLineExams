using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITI_Online_Exams
{
    public partial class Questions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show_courses();
                show_Questions();
            }
        }
        public void show_courses()
        {
            OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
            List<Course> allcourses = _container.Courses.ToList();
            ddl_courses.DataSource = allcourses;
            ddl_courses.DataBind();
        }
        public void show_Questions()
        {
            OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
            List<Question> allQuestions = _container.Questions.ToList();
            grd_Questions.DataSource = allQuestions;
            grd_Questions.DataBind();
        }
        protected void btn_save_Q_Click(object sender, EventArgs e)
        {
            if (btn_save_Q.Text == "Save")
            {
                Question new_question = new Question();
                new_question.Qstn_Text = txt_qtext.Text;
                lbl_Qtype.Text = "";
                if (txt_qtype.Text == "MCQ" || txt_qtype.Text == "TFQ")
                {
                    new_question.Qstn_Type = txt_qtype.Text;
                }
                else
                {
                    lbl_Qtype.Text = "Must be MCQ or TFQ";
                }
                if (txt_qanswer.Text == "a" || txt_qanswer.Text == "b" ||
                    txt_qanswer.Text == "c" || txt_qanswer.Text == "d" ||
                    txt_qanswer.Text == "TRUE" || txt_qanswer.Text == "FALSE")

                {
                    new_question.Qstn_Answer = txt_qanswer.Text;
                    lbl_Qanswer.Text = "";
                }
                else
                {
                    lbl_Qanswer.Text = "value must be a,b,c,d,TRUE,FALSE";
                }

                new_question.Qstn_Id = int.Parse(txt_qid.Text);
                new_question.Crs_Id = int.Parse(ddl_courses.SelectedValue);

                OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
                _container.Questions.Add(new_question);
                _container.SaveChanges();

                show_courses();
                show_Questions();
                clearvalues();
            }
            else
            {
                int Question_Id = int.Parse(Q_hidden_id.Value);
                OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
                Question Q_update = _container.Questions.Where(a => a.Qstn_Id == Question_Id).FirstOrDefault();
                Q_update.Qstn_Text = txt_qtext.Text;
                Q_update.Qstn_Type = txt_qtype.Text;
                Q_update.Qstn_Answer = txt_qanswer.Text;


                _container.SaveChanges();
                show_Questions();
                clearvalues();
                btn_save_Q.Text = "Save";
            }

        }
        public void clearvalues()
        {
            txt_qanswer.Text = string.Empty;
            txt_qid.Text = string.Empty;
            txt_qtype.Text = string.Empty;
            txt_qtext.Text = string.Empty;
        }

        protected void txt_qtype_TextChanged(object sender, EventArgs e)
        {

        }

        protected void grd_Questions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int _QuestionId = int.Parse(e.CommandArgument.ToString());
            string _actionName = e.CommandName;
            if (_actionName == "DeleteQuestion")
            {
                OnlineExamsProjectDBEntities _context = new OnlineExamsProjectDBEntities();
                Question _Question = _context.Questions.Where(a => a.Qstn_Id == _QuestionId).FirstOrDefault();
                if(_Question.Choices.Count==0 && _Question.Exam_Question.Count == 0)
                {
                    _context.Questions.Remove(_Question);
                    _context.SaveChanges();
                    show_Questions();
                }
                else
                {
                    lbl_msg_q.Text = "this Question can't be deleted";
                }
               
            }
            else if (_actionName == "EditCurrentQuestion")
            {
                OnlineExamsProjectDBEntities _context = new OnlineExamsProjectDBEntities();
                Question _Question = _context.Questions.Where(a => a.Qstn_Id == _QuestionId).FirstOrDefault();
                txt_qid.Text = _Question.Qstn_Id.ToString();
                txt_qtext.Text = _Question.Qstn_Text;
                txt_qtype.Text = _Question.Qstn_Type;
                txt_qanswer.Text = _Question.Qstn_Answer;
                ddl_courses.SelectedValue = _Question.Crs_Id.ToString();
                btn_save_Q.Text = "Update";
                Q_hidden_id.Value = _QuestionId.ToString();
            }
        }
    }
}