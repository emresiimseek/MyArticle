using FrameworkCore.Concrete;
using Microsoft.EntityFrameworkCore;
using MyArticle.DataAccess.Abstract;
using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.DataAccess.Concrete
{
    public class ArticleDal : EntityRepositoryBase<Article>, IArticleDal
    {
        private MyContext myContext { get => _dbContext as MyContext; }
        public ArticleDal(DbContext context) : base(context)
        {
        }
    }
}
