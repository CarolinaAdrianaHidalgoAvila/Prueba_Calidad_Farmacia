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
    public class LaboratoryService : ILaboratoryService
    {
        private ILaboratoryRepository _laboratoryRepository;
        private IMapper _mapper;
        public LaboratoryService(ILaboratoryRepository laboratoryRepository, IMapper mapper)
        {
            _laboratoryRepository = laboratoryRepository;
            _mapper = mapper;
        }

        private HashSet<string> _allowedSortValues = new HashSet<string> { "id", "name", "address","phone","email","makeOrders" };

        public async  Task<LaboratoryModel> CreateLaboratoryAsync(LaboratoryModel laboratory)
        {
            var laboratoryEntity = _mapper.Map<LaboratoryEntity>(laboratory);
            _laboratoryRepository.CreateLaboratory(laboratoryEntity);
            var result = await _laboratoryRepository.SaveChangesAsync();
            if (result)
            {
                return _mapper.Map<LaboratoryModel>(laboratoryEntity);
            }

            throw new Exception("Database Error.");
        }

        public async Task DeleteLaboratoryAsync(int laboratoryId)
        {
            await GetLaboratoryAsync(laboratoryId);
            await _laboratoryRepository.DeleteLaboratoryAsync(laboratoryId);
            var result = await _laboratoryRepository.SaveChangesAsync();
            if (!result)
            {
                throw new Exception("Database Error.");
            }
        }
        public async Task<LaboratoryModel> GetLaboratoryAsync(int laboratoryId)
        {
            var laboratory = await _laboratoryRepository.GetLaboratoryAsync(laboratoryId);

            if (laboratory == null)
                throw new NotFoundElementException($"the Laboratory with id:{laboratoryId} does not exists.");

            return _mapper.Map<LaboratoryModel>(laboratory);
        }

        public async Task<IEnumerable<LaboratoryModel>> GetLaboratoriesAsync(string orderBy = "id")
        {
            if (!_allowedSortValues.Contains(orderBy.ToLower()))
                throw new InvalidElementOperationException($"invalid orderBy value : {orderBy}. The allowed values for param are: {string.Join(',', _allowedSortValues)}");

            var laboratoryEntityList = await _laboratoryRepository.GetLaboratoriesAsync(orderBy);
            return _mapper.Map<IEnumerable<LaboratoryModel>>(laboratoryEntityList);
        }


        public async Task<LaboratoryModel> UpdateLaboratoryAsync(int laboratoryId, LaboratoryModel laboratory)
        {
            await GetLaboratoryAsync(laboratoryId);
            var laboratoryEntity = _mapper.Map<LaboratoryEntity>(laboratory);
            await _laboratoryRepository.UpdateLaboratoryAsync(laboratoryId, laboratoryEntity);
            var result = await _laboratoryRepository.SaveChangesAsync();
            if (result)
            {
                return _mapper.Map<LaboratoryModel>(laboratoryEntity);
            }

            throw new Exception("Database Error.");
        }
    }
}
