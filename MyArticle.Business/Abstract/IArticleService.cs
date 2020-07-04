using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.Business.Abstract
{
    public interface IArticleService
    {
        Article GetArticle(int Id);
        List<Article> GetArticles();
        void UpdateArticle(Article article);
        void DeleteArticle(Article article);
        void AddArticle(Article article);
    }
}
