//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ITI_Online_Exams
{
    using System;
    using System.Collections.Generic;
    
    public partial class Course
    {
        public Course()
        {
            this.Exams = new HashSet<Exam>();
            this.Ins_Course = new HashSet<Ins_Course>();
            this.Questions = new HashSet<Question>();
            this.Stud_Course = new HashSet<Stud_Course>();
            this.Topics = new HashSet<Topic>();
        }
    
        public int Crs_Id { get; set; }
        public string Crs_Name { get; set; }
        public Nullable<int> Crs_Duration { get; set; }
    
        public virtual ICollection<Exam> Exams { get; set; }
        public virtual ICollection<Ins_Course> Ins_Course { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<Stud_Course> Stud_Course { get; set; }
        public virtual ICollection<Topic> Topics { get; set; }
    }
}
