using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITI_Online_Exams
{
    public partial class Topics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                show_courses();
                show_topics();
            }
        }
        public void show_courses()
        {
            OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
            List<Course> allcourses = _container.Courses.ToList();
            ddl_coursename.DataSource = allcourses;
            ddl_coursename.DataBind();
        }
        public void show_topics()
        {
            OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
            List<Topic> alltopics = _container.Topics.ToList();
            grd_topics.DataSource = alltopics;
            grd_topics.DataBind();
        }
        public void clear_all()
        {
            txt_topic_id.Text = string.Empty;
            txt_topic_name.Text = string.Empty;
        }

        protected void btn_save_topic_Click(object sender, EventArgs e)
        {
            if (btn_save_topic.Text == "Save")
            {
                Topic new_topic = new Topic();
                new_topic.Top_Id = int.Parse(txt_topic_id.Text);
                new_topic.Top_Name = txt_topic_name.Text;
                new_topic.Crs_Id = int.Parse(ddl_coursename.SelectedValue);
                OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
                _container.Topics.Add(new_topic);
                _container.SaveChanges();

                show_courses();
                show_topics();
                clear_all();
            }
            else
            {
                int Topic_Id = int.Parse(Topic_Hidden_id.Value);
                OnlineExamsProjectDBEntities _container = new OnlineExamsProjectDBEntities();
                Topic topic_update = _container.Topics.Where(a => a.Top_Id == Topic_Id).FirstOrDefault();
                topic_update.Top_Id = int.Parse(txt_topic_id.Text);
                topic_update.Top_Name = txt_topic_name.Text;
                topic_update.Crs_Id = int.Parse(ddl_coursename.SelectedValue);


                _container.SaveChanges();
                show_topics();
                clear_all();
                btn_save_topic.Text = "Save";
            }
        }

        protected void grd_topics_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int _TopicId = int.Parse(e.CommandArgument.ToString());
            string _actionName = e.CommandName;
            if (_actionName == "DeleteTopic")
            {
                OnlineExamsProjectDBEntities _context = new OnlineExamsProjectDBEntities();
                Topic _Topic = _context.Topics.Where(a => a.Top_Id == _TopicId).FirstOrDefault();

                _context.Topics.Remove(_Topic);
                _context.SaveChanges();
                show_topics();
            }
            else if (_actionName == "EditCurrentTopic")
            {
                OnlineExamsProjectDBEntities _context = new OnlineExamsProjectDBEntities();
                Topic _Topic = _context.Topics.Where(a => a.Top_Id == _TopicId).FirstOrDefault();
                txt_topic_id.Text = _Topic.Top_Id.ToString();
                txt_topic_name.Text = _Topic.Top_Name;
                ddl_coursename.SelectedValue = _Topic.Crs_Id.ToString();
                btn_save_topic.Text = "Update";
                Topic_Hidden_id.Value = _TopicId.ToString();
            }
        }
    }
}