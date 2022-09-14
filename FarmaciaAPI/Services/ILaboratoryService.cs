using System;
using FarmaciaAPI.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Services
{
    public interface ILaboratoryService
    {
        Task<IEnumerable<LaboratoryModel>> GetLaboratoriesAsync(string orderBy);
        Task<LaboratoryModel> GetLaboratoryAsync(int laboratoryId);
        Task<LaboratoryModel> CreateLaboratoryAsync(LaboratoryModel laboratory);
        Task<LaboratoryModel> UpdateLaboratoryAsync(int laboratoryId, LaboratoryModel laboratory);
        Task DeleteLaboratoryAsync(int laboratoryId);
    }
}
