using FakerDotNet;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.DataAccess.Initilazers
{
    public class ArticleInitilazers : IEntityTypeConfiguration<Article>
    {
        public void Configure(EntityTypeBuilder<Article> builder)
        {
            Random random = new Random();

            int j = 0;
            for (int i = 1; i < 15; i++)
            {
                j++;
                builder.HasData(new Article
                {
                    Id = i,
                    AuthorId = j,
                    CategoryId = j,
                    Content = Faker.Lorem.Paragraph(50),
                    Description = Faker.Lorem.Sentence(),
                    PublishedAt = Faker.Date.Backward(365),
                    Title = Faker.Lorem.Sentence()
                });
                if (j == 3)
                {
                    j = 0;
                }
            }
        }
    }
}
