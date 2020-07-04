using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace MyArticle.EntityFramework.Concete.DTOs
{
    public class ArticleDto
    {
        public int Id { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public DateTime PublishedAt { get; set; }
        [Required]
        public string Content { get; set; }
        public string CategoryTitle { get; set; }
        public string Author { get; set; }
        public int AuthorId { get; set; }
        public int CategoryId { get; set; }


    }
}
