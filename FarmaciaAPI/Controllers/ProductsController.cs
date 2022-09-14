using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using FarmaciaAPI.Exceptions;
using FarmaciaAPI.Models;
using FarmaciaAPI.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Controllers
{
    [Route("api/laboratories/{laboratoryId:int}/[controller]")]
    public class ProductsController : Controller
    {
        private IProductService _productService;
        private IFileService _fileService;

        public ProductsController(IProductService productService, IFileService fileService)
        {
            _productService = productService;
            _fileService = fileService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductModel>>> GetProductsAsync(int laboratoryId)
        {
            try
            {
                return Ok(await _productService.GetProductsAsync(laboratoryId));
            }
            catch (NotFoundElementException ex)
            {
                return NotFound(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Simething happend.");
            }
        }


        [HttpGet("{productId:int}")]
        public async Task<ActionResult<ProductModel>> GetProductAsync(int laboratoryId, int productId)
        {
            try
            {
                var product = await _productService.GetProductAsync(laboratoryId, productId);
                return Ok(product);
            }
            catch (NotFoundElementException ex)
            {
                return NotFound(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Simething happend.");
            }
        }

        [HttpPost]
        public async Task<ActionResult<ProductModel>> PostProductAsync(int laboratoryId, [FromForm] ProductFormModel newProduct)
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);
                var file = newProduct.Image;
                string imagePath = _fileService.UploadFile(file);

                newProduct.ImagePath = imagePath;
                var product = await _productService.CreateProductAsync(laboratoryId, newProduct);
                return Created($"/api/laboratories/{product.LaboratoryId}/products/{product.Id}", product);

            }
            catch (NotFoundElementException ex)
            {
                return NotFound(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Simething happend.");
            }
        }

        [HttpDelete("{productId}")]
        public async Task<ActionResult> DeleteProductAsync(int laboratoryId, int productId)
        {
            try
            {
                await _productService.DeleteProductAsync(laboratoryId, productId);
                return Ok();
            }
            catch (NotFoundElementException ex)
            {
                return NotFound(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Simething happend.");
            }
        }

        [HttpPut("{productId}")]
        public async Task<ActionResult<ProductModel>> UpdateProductAsync(int laboratoryId, int productId, [FromForm] ProductFormModel product)
        {
            try
            {
                var file = product.Image;
                string imagePath = _fileService.UploadFile(file);

                product.ImagePath = imagePath;

                var updatedProduct = await _productService.UpdateProductAsync(laboratoryId, productId, product);
                return Ok(updatedProduct);
            }
            catch (NotFoundElementException ex)
            {
                return NotFound(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Simething happend.");
            }
        }
    }
}
