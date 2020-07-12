using FrameworkCore.Abstract;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace FrameworkCore.Concrete
{
    public class EntityRepositoryBase<TEntity> : IEntityRepository<TEntity>
        where TEntity : class, new()
    {
        public readonly DbContext _dbContext;
        public readonly DbSet<TEntity> _dbSet;
        public EntityRepositoryBase(DbContext dbContext)
        {
            this._dbContext = dbContext;
            _dbSet = dbContext.Set<TEntity>();
            _dbContext.SaveChanges();
        }

        public async Task Add(TEntity entity)
        {
            await _dbSet.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
        }

        public void Delete(TEntity entity)
        {
            _dbSet.Remove(entity);
            _dbContext.SaveChanges();
        }

        public  Task<TEntity> Get(Expression<Func<TEntity, bool>> filter)
        {
             return  _dbSet.Include("Author").Include("Category").SingleOrDefaultAsync(filter);
        }

        public List<TEntity> GetAll(Expression<Func<TEntity, bool>> filter = null)
        {
            return filter == null ?
                  _dbSet.Include("Author").Include("Category").ToList() :
                  _dbSet.Where(filter).ToList();
        }

        public void Update(TEntity entity)
        {
            _dbContext.Entry(entity).State = EntityState.Modified;
            _dbContext.SaveChanges();
        }
    }
}
