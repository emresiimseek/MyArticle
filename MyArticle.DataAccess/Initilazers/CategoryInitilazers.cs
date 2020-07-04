using FakerDotNet;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.DataAccess.Initilazers
{
    public class CategoryInitilazers : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            for (int i = 1; i <= 3; i++)
            {
                builder.HasData(new Category { Id = i, Title = Faker.Cat.Name() });
            }
        }
    }
}
