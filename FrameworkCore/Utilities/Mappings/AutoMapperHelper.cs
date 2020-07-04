using AutoMapper;
using MyArticle.EntityFramework.Concete;
using MyArticle.EntityFramework.Concete.DTOs;
using System;
using System.Collections.Generic;
using System.Text;

namespace FrameworkCore.Utilities.Mappings
{
    public class AutoMapperHelpers : IAutoMapperBase
    {
        public List<TDest> MapToSameTypeList<TSource, TDest>(List<TSource> list)
           where TSource : new()
        {


            if (typeof(TSource) == typeof(Article))
            {
                var config = new MapperConfiguration(cfg => cfg.CreateMap<Article, ArticleDto>()
                    .ForMember(dest => dest.Author, act => act.MapFrom(dest => dest.Author.Name + dest.Author.LastName))
                    .ForMember(x => x.CategoryTitle, y => y.MapFrom(x => x.Category.Title))
                    );
                IMapper mapper = config.CreateMapper();
                return mapper.Map<List<TSource>, List<TDest>>(list);
            }
            else
            {

                var config = new MapperConfiguration(cfg => { cfg.CreateMap<TSource, TDest>(); });
                IMapper mapper = config.CreateMapper();
                return mapper.Map<List<TSource>, List<TDest>>(list);
            }
        }

        public TDest MapToSameType<TSource, TDest>(TSource obj)
            where TSource : new()
        {

            if (typeof(TSource) == typeof(Article))
            {
                var config = new MapperConfiguration(cfg => cfg.CreateMap<Article, ArticleDto>()
                    .ForMember(dest => dest.Author, act => act.MapFrom(dest => dest.Author.Name + dest.Author.LastName))
                    .ForMember(x => x.CategoryTitle, y => y.MapFrom(x => x.Category.Title))
                    );
                IMapper mapper = config.CreateMapper();
                return mapper.Map<TSource, TDest>(obj);
            }
            else
            {
                var config = new MapperConfiguration(cfg => { cfg.CreateMap<TSource, TDest>(); });
                IMapper mapper = config.CreateMapper();
                return mapper.Map<TSource, TDest>(obj);
            }


        }
    }
}
