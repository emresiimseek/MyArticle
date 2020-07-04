using MyArticle.EntityFramework.Abstract;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;

namespace MyArticle.EntityFramework.Concete
{
    public class Article : IEntity
    {
        public int Id { get; set; }
        public int AuthorId { get; set; }
        public int CategoryId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime PublishedAt { get; set; }
        public string Content { get; set; }
        [JsonIgnore]
        public virtual Author Author { get; set; }
        public virtual Category Category { get; set; }

    }
}
