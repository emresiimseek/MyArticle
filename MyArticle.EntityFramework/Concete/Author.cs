using MyArticle.EntityFramework.Abstract;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.EntityFramework.Concete
{
    public class Author : IEntity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public bool IsActive { get; set; }
        public virtual List<Article> Articles { get; set; }
    }
}
