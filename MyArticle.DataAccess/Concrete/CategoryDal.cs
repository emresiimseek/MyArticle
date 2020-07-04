using FrameworkCore.Concrete;
using Microsoft.EntityFrameworkCore;
using MyArticle.DataAccess.Abstract;
using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.DataAccess.Concrete
{
    public class CategoryDal : EntityRepositoryBase<Category>, ICategoryDal
    {
        private MyContext myContext { get => _dbContext as MyContext; }
        public CategoryDal(DbContext context) : base(context)
        {
        }
    }
}
