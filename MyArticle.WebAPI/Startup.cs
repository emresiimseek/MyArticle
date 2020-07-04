using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FrameworkCore.Abstract;
using FrameworkCore.Concrete;
using FrameworkCore.Utilities.Mappings;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using MyArticle.Business.Abstract;
using MyArticle.Business.Concrete;
using MyArticle.DataAccess;
using MyArticle.DataAccess.Abstract;
using MyArticle.DataAccess.Concrete;

namespace MyArticle.WebAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddScoped<DbContext, MyContext>();
            services.AddScoped(typeof(IEntityRepository<>), typeof(EntityRepositoryBase<>));
            services.AddScoped(typeof(IArticleService), typeof(ArticleManager));
            services.AddScoped(typeof(IArticleDal), typeof(ArticleDal));
            services.AddScoped(typeof(IAuthorDal), typeof(AuthorDal));
            services.AddScoped(typeof(ICategoryDal), typeof(CategoryDal));
            services.AddScoped(typeof(IAutoMapperBase), typeof(AutoMapperHelpers));
            services.AddControllers().AddNewtonsoftJson(options =>
            options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);
            services.AddDbContext<MyContext>(options =>
            {
                options.UseSqlServer(Configuration["ConnectionStrings:SqlConStr"].ToString(), o =>
                {
                    o.MigrationsAssembly("MyArticle.DataAccess");
                });
            });
            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
