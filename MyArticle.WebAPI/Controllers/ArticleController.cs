using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FrameworkCore.Utilities.Mappings;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyArticle.Business.Abstract;
using MyArticle.EntityFramework.Concete;
using MyArticle.EntityFramework.Concete.DTOs;

namespace MyArticle.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticleController : ControllerBase
    {
        private readonly IArticleService _articleService;
        private IAutoMapperBase _autoMapperBase;
        public ArticleController(IArticleService articleService, IAutoMapperBase autoMapperBase)
        {
            _articleService = articleService;
            _autoMapperBase = autoMapperBase;
        }
        [HttpGet]
        public IActionResult GetAll()
        {
            List<Article> articles = _articleService.GetArticles();
            return Ok(_autoMapperBase.MapToSameTypeList<Article, ArticleDto>(articles));
        }

    }
}
