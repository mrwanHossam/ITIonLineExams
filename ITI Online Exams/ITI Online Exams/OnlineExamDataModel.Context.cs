﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class OnlineExamsProjectDBEntities : DbContext
    {
        public OnlineExamsProjectDBEntities()
            : base("name=OnlineExamsProjectDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Choice> Choices { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<Exam> Exams { get; set; }
        public DbSet<Exam_Question> Exam_Question { get; set; }
        public DbSet<Ins_Course> Ins_Course { get; set; }
        public DbSet<Instructor> Instructors { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Stud_Course> Stud_Course { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<Topic> Topics { get; set; }
    }
}