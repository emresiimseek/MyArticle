using Microsoft.EntityFrameworkCore;
using MyArticle.DataAccess.Configurations;
using MyArticle.DataAccess.Initilazers;
using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.DataAccess
{
    public class MyContext : DbContext
    {
        public DbSet<Article> Articles { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Category> Categories { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new ArticleConfiguration());
            modelBuilder.ApplyConfiguration(new AuthorConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());

            modelBuilder.ApplyConfiguration(new AuthorInitilazer());
            modelBuilder.ApplyConfiguration(new CategoryInitilazers());
            modelBuilder.ApplyConfiguration(new ArticleInitilazers());
        }
    }
}
