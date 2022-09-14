using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace FarmaciaAPI.Models
{
    public class ProductFormModel: ProductModel
    {
        public IFormFile Image { get; set; }
    }
}
