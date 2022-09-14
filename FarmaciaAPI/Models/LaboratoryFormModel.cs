using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
namespace FarmaciaAPI.Models
{
    public class LaboratoryFormModel : LaboratoryModel
    {
        public IFormFile Image { get; set; }
    }
}
