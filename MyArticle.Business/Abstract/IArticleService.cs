using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MyArticle.Business.Abstract
{
    public interface IArticleService
    {
        Task<Article> GetArticle(int Id);
        List<Article> GetArticles();
        void UpdateArticle(Article article);
        void DeleteArticle(Article article);
        Task AddArticle(Article article);
    }
}
