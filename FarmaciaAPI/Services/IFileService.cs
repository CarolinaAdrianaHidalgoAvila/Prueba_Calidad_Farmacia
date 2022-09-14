using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
namespace FarmaciaAPI.Services
{
    public interface IFileService
    {
        string UploadFile(IFormFile file);
    }
}
