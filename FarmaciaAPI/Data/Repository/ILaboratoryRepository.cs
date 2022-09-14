using FarmaciaAPI.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Data.Repository
{
    public interface ILaboratoryRepository
    {
        //Laboratories
        Task<IEnumerable<LaboratoryEntity>> GetLaboratoriesAsync(string orderBy);
        Task<LaboratoryEntity> GetLaboratoryAsync(int laboratoryId);
        void CreateLaboratory(LaboratoryEntity laboratory);
        Task UpdateLaboratoryAsync(int laboratoryId, LaboratoryEntity laboratory);
        Task DeleteLaboratoryAsync(int laboratoryId);


        //Products
        Task<IEnumerable<ProductEntity>> GetProductsAsync(int laboratoryId);
        Task<ProductEntity> GetProductAsync(int laboratoryId, int productId);
        void CreateProduct(int laboratoryId, ProductEntity product);
        Task DeleteProductAsync(int laboratoryId, int productId);
        Task UpdateProductAsync(int laboratoryId, int productId, ProductEntity product);

        Task<bool> SaveChangesAsync();
    }
}
