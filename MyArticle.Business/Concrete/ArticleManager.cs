using MyArticle.Business.Abstract;
using MyArticle.DataAccess.Abstract;
using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyArticle.Business.Concrete
{
    public class ArticleManager : IArticleService
    {
        public IArticleDal _articleDal;
        public ArticleManager(IArticleDal articleDal)
        {
            _articleDal = articleDal;
        }

        public async Task AddArticle(Article article)
        {
            await _articleDal.Add(article);
        }

        public void DeleteArticle(Article article)
        {
            _articleDal.Delete(article);
        }

        public async Task<Article> GetArticle(int Id)
        {

            return await _articleDal.Get(x => x.Id == Id);
        }

        public List<Article> GetArticles()
        {
            return _articleDal.GetAll().ToList();
        }

        public void UpdateArticle(Article article)
        {
            _articleDal.Update(article);
        }
    }
}
