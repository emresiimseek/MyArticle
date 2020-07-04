using FakerDotNet;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.DataAccess.Initilazers
{
    public class AuthorInitilazer : IEntityTypeConfiguration<Author>
    {

        public void Configure(EntityTypeBuilder<Author> builder)
        {

            for (int i = 1; i <= 3; i++)
            {
                builder.HasData(
                               new Author
                               {
                                   Id = i,
                                   Name = Faker.Name.FirstName(),
                                   LastName = Faker.Name.LastName(),
                                   IsActive = Faker.Boolean.Boolean()
                               });
            }

        }
    }
}
