using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;

namespace FrameworkCore.Abstract
{
    public interface IEntityRepository<T>
       where T : class, new()
    {
        T Get(Expression<Func<T, bool>> filter);
        List<T> GetAll(Expression<Func<T, bool>> filter = null);
        void Update(T entity);
        void Delete(T entity);
        void Add(T entity);
    }
}
