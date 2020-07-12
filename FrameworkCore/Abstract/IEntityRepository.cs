using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace FrameworkCore.Abstract
{
    public interface IEntityRepository<T>
       where T : class, new()
    {
        Task<T> Get(Expression<Func<T, bool>> filter);
        List<T> GetAll(Expression<Func<T, bool>> filter = null);
        void Update(T entity);
        void Delete(T entity);
        Task  Add(T entity);
    }
}
