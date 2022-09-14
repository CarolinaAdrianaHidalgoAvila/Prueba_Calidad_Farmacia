using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Data.Entities
{
    public class ProductEntity
    {
        [Key]
        [Required]
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal? PurchasePrice { get; set; }
        public decimal? SalePrice { get; set; }
        public int? Stock { get; set; }
        public string Presentation { get; set; }
        public string TherapeuticAction { get; set; }
        public string ImagePath { get; set; }
        [ForeignKey("LaboratoryId")]
        public virtual LaboratoryEntity Laboratory { get; set; }
    }
}
