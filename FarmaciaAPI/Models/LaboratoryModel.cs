using FarmaciaAPI.Data.Entities;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Models
{
    public class LaboratoryModel
    {
        public int Id { get; set; }

        
        public string Name { get; set; }

        [MaxLength(40)]
        public string Address { get; set; }

        [Phone]
        public string Phone { get; set; }
        public string Email { get; set; }
        public int MakeOrders { get; set; }
        public string ImagePath { get; set; }
        public IEnumerable<ProductModel> Products { get; set; }
    }
}

