using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MyArticle.EntityFramework.Concete;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyArticle.DataAccess.Configurations
{
    public class ArticleConfiguration : IEntityTypeConfiguration<Article>
    {
        public void Configure(EntityTypeBuilder<Article> builder)
        {
            builder.HasKey(a => a.Id);
            builder.Property(a => a.Id).UseIdentityColumn();
            builder.Property(a => a.PublishedAt).IsRequired().HasColumnType("datetime");
            builder.Property(a => a.Title).IsRequired().HasMaxLength(200);
            builder.Property(a => a.Content).IsRequired().HasMaxLength(4000);
            builder.Property(a => a.Description).IsRequired().HasMaxLength(500);
            builder.ToTable("Articles");

        }
    }
}
