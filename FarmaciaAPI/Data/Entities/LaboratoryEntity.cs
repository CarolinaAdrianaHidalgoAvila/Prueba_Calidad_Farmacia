using FarmaciaAPI.Models;
using System.ComponentModel.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Data.Entities
{
        public class LaboratoryEntity
        {
            [Key]
            [Required]
            public int Id { get; set; }

            public string Name { get; set; }

            public string Address { get; set; }

            public string Phone { get; set; }
            public string Email { get; set; }
            public int? MakeOrders { get; set; }
            public string ImagePath { get; set; }
            public ICollection<ProductEntity> Products { get; set; }
        }
}
