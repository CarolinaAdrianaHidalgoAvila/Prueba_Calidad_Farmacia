using AutoMapper;
using FarmaciaAPI.Data.Entities;
using FarmaciaAPI.Data.Repository;
using FarmaciaAPI.Exceptions;
using FarmaciaAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Services
{
    public class ProductService : IProductService
    {
        private ILaboratoryRepository _laboratoryRepository;
        private IMapper _mapper;
        public ProductService(ILaboratoryRepository laboratoryRepository, IMapper mapper)
        {
            _laboratoryRepository = laboratoryRepository;
            _mapper = mapper;
        }
        public async Task<ProductModel> CreateProductAsync(int laboratoryId, ProductModel product)
        {
            await ValidateLaboratoryAsync(laboratoryId);
            product.LaboratoryId = laboratoryId;
            var entity = _mapper.Map<ProductEntity>(product);
            _laboratoryRepository.CreateProduct(laboratoryId, entity);
            var result = await _laboratoryRepository.SaveChangesAsync();
            if (result)
            {
                return _mapper.Map<ProductModel>(entity);
            }

            throw new Exception("Database Error.");
        }

        public async  Task DeleteProductAsync(int laboratoryId, int productId)
        {
            await GetProductAsync(laboratoryId, productId);
            await _laboratoryRepository.DeleteProductAsync(laboratoryId, productId);
            var result = await _laboratoryRepository.SaveChangesAsync();
            if (!result)
            {
                throw new Exception("Database Error.");

            }
        }

        public async  Task<ProductModel> GetProductAsync(int laboratoryId, int productId)
        {
            await ValidateLaboratoryAsync(laboratoryId);

            var product = await _laboratoryRepository.GetProductAsync(laboratoryId, productId);
            if (product == null)
                throw new NotFoundElementException($"the product with id:{productId} does not exists for the given laboratory with id: {laboratoryId}.");

            return _mapper.Map<ProductModel>(product);
        }

        public async Task<IEnumerable<ProductModel>> GetProductsAsync(int laboratoryId)
        {
            await ValidateLaboratoryAsync(laboratoryId);
            var products = await _laboratoryRepository.GetProductsAsync(laboratoryId);
            return _mapper.Map<IEnumerable<ProductModel>>(products);
        }

        public async Task<ProductModel> UpdateProductAsync(int laboratoryId, int productId, ProductModel product)
        {
            await GetProductAsync(laboratoryId, productId);
            var entity = _mapper.Map<ProductEntity>(product);
            await _laboratoryRepository.UpdateProductAsync(laboratoryId, productId, entity);
            var result = await _laboratoryRepository.SaveChangesAsync();
            if (result)
            {
                return _mapper.Map<ProductModel>(entity);
            }

            throw new Exception("Database Error.");
        }
        private async Task ValidateLaboratoryAsync(int laboratoryId)
        {
            var laboratory = await _laboratoryRepository.GetLaboratoryAsync(laboratoryId);
            if (laboratory == null)
                throw new NotFoundElementException($"the laboratory with id:{laboratoryId} does not exists.");
        }
    }
}
