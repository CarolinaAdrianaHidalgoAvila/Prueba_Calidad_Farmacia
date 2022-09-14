using FarmaciaAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Services
{
    public interface IProductService
    {
        Task<IEnumerable<ProductModel>> GetProductsAsync(int laboratoryId);
        Task<ProductModel> GetProductAsync(int laboratoryId, int productId);
        Task<ProductModel> CreateProductAsync(int laboratoryId, ProductModel product);
        Task DeleteProductAsync(int laboratoryId, int productId);
        Task<ProductModel> UpdateProductAsync(int laboratoryId, int productId, ProductModel product);
    }
}
