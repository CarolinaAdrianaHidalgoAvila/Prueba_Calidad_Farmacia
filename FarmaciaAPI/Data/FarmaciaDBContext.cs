using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using FarmaciaAPI.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Data
{
    public class FarmaciaDBContext : IdentityDbContext
    {
        public DbSet<LaboratoryEntity> Laboratories { get; set; }
        public DbSet<ProductEntity> Products { get; set; }

        public FarmaciaDBContext(DbContextOptions<FarmaciaDBContext> options)
            : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<LaboratoryEntity>().ToTable("Laboratories");
            modelBuilder.Entity<LaboratoryEntity>().Property(r => r.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<LaboratoryEntity>().HasMany(r => r.Products).WithOne(d => d.Laboratory);

            modelBuilder.Entity<ProductEntity>().ToTable("Products");
            modelBuilder.Entity<ProductEntity>().Property(r => r.Id).ValueGeneratedOnAdd();
            modelBuilder.Entity<ProductEntity>().HasOne(d => d.Laboratory).WithMany(r => r.Products);
        }
    }
}
