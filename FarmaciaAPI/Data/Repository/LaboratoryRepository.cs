using Microsoft.EntityFrameworkCore;
using FarmaciaAPI.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Data.Repository
{
    public class LaboratoryRepository : ILaboratoryRepository
    {
        private FarmaciaDBContext _dbContext;
        public LaboratoryRepository(FarmaciaDBContext dbContext)
        {
            _dbContext = dbContext;
        }
        public void CreateLaboratory(LaboratoryEntity laboratory)
        {
            _dbContext.Laboratories.Add(laboratory);
        }

        public void CreateProduct(int laboratoryId, ProductEntity product)
        {
            _dbContext.Entry(product.Laboratory).State = EntityState.Unchanged;
            _dbContext.Products.Add(product);
        }

        public async  Task DeleteLaboratoryAsync(int laboratoryId)
        {
            var laboratoryToDelete = await _dbContext.Laboratories.SingleOrDefaultAsync(r => r.Id == laboratoryId);
            _dbContext.Laboratories.Remove(laboratoryToDelete);
        }

        public async Task DeleteProductAsync(int laboratoryId, int productId)
        {
            var productToDelete = await _dbContext.Products.FirstOrDefaultAsync(d => d.Laboratory.Id == laboratoryId && d.Id == productId);
            _dbContext.Products.Remove(productToDelete);
        }

        public async Task<IEnumerable<LaboratoryEntity>> GetLaboratoriesAsync(string orderBy)
        {
            IQueryable<LaboratoryEntity> query = _dbContext.Laboratories;
            query = query.AsNoTracking();

            switch (orderBy.ToLower())
            {
                case "id":
                    query = query.OrderBy(r => r.Id);
                    break;
                case "name":
                    query = query.OrderBy(r => r.Name);
                    break;
                case "address":
                    query = query.OrderBy(r => r.Address);
                    break;
                case "phone":
                    query = query.OrderBy(r => r.Phone);
                    break;
                case "email":
                    query = query.OrderBy(r => r.Email);
                    break;
                case "makeOrders":
                    query = query.OrderBy(r => r.MakeOrders);
                    break;
                default:
                    query = query.OrderBy(r => r.Id);
                    break;
            }

            var result = await query.ToListAsync();

            return result;
        }

        public async Task<LaboratoryEntity> GetLaboratoryAsync(int laboratoryId)
        {
            IQueryable<LaboratoryEntity> query = _dbContext.Laboratories;
            query = query.AsNoTracking();
            return await query.FirstOrDefaultAsync(r => r.Id == laboratoryId);
        }

        public async Task<ProductEntity> GetProductAsync(int laboratoryId, int productId)
        {
            IQueryable<ProductEntity> query = _dbContext.Products;
            query = query.AsNoTracking();
            return await query.FirstOrDefaultAsync(d => d.Id == productId && d.Laboratory.Id == laboratoryId);
        }

        public async Task<IEnumerable<ProductEntity>> GetProductsAsync(int laboratoryId)
        {
            IQueryable<ProductEntity> query = _dbContext.Products;
            query = query.AsNoTracking();
            query = query.Where(d => d.Laboratory.Id == laboratoryId);
            return await query.ToListAsync();
        }

        public async Task<bool> SaveChangesAsync()
        {
            try
            {
                var result = await _dbContext.SaveChangesAsync();
                return result > 0 ? true : false;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async  Task UpdateLaboratoryAsync(int laboratoryId, LaboratoryEntity laboratory)
        {
            var laboratoryToUpdate = await _dbContext.Laboratories.FirstAsync(r => r.Id == laboratoryId);

            laboratoryToUpdate.Name = laboratory.Name ?? laboratoryToUpdate.Name;
            laboratoryToUpdate.Address = laboratory.Address ?? laboratoryToUpdate.Address;
            laboratoryToUpdate.Phone = laboratory.Phone ?? laboratoryToUpdate.Phone;
            laboratoryToUpdate.Email = laboratory.Email ?? laboratoryToUpdate.Email;
            laboratoryToUpdate.MakeOrders = laboratory.MakeOrders ?? laboratoryToUpdate.MakeOrders;
            laboratoryToUpdate.ImagePath = laboratory.ImagePath ?? laboratoryToUpdate.ImagePath;
        }

        public async Task UpdateProductAsync(int laboratoryId, int productId, ProductEntity product)
        {

            var productToUpdate = await _dbContext.Products.FirstOrDefaultAsync(d => d.Id == productId && d.Laboratory.Id == laboratoryId);
            productToUpdate.Name = product.Name ?? productToUpdate.Name;
            productToUpdate.PurchasePrice = product.PurchasePrice ?? productToUpdate.PurchasePrice;
            productToUpdate.SalePrice = product.SalePrice ?? productToUpdate.SalePrice;
            productToUpdate.Stock = product.Stock ?? productToUpdate.Stock;
            productToUpdate.Presentation = product.Presentation ?? productToUpdate.Presentation;
            productToUpdate.TherapeuticAction = product.TherapeuticAction ?? productToUpdate.TherapeuticAction;
            productToUpdate.ImagePath = product.ImagePath ?? productToUpdate.ImagePath;
        }
    }
}
