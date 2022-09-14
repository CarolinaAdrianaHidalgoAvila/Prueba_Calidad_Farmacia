using System.ComponentModel.DataAnnotations;

namespace FarmaciaAPI.Models
{
    public class ProductModel
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        public decimal? PurchasePrice { get; set; }
        public decimal? SalePrice { get; set; }
        public int? Stock { get; set; }
        public string Presentation { get; set; }
        public string TherapeuticAction { get; set; }
        public string ImagePath { get; set; }
        public int LaboratoryId { get; set; }
    }
}
