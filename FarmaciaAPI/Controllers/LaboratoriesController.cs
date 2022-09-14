using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using FarmaciaAPI.Exceptions;
using FarmaciaAPI.Models;
using FarmaciaAPI.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using System.IO;
using System.Net.Http.Headers;

namespace FarmaciaAPI.Controllers
{
    [Authorize()]
    [Route("api/[controller]")]
    public class LaboratoriesController : Controller
    {
        private ILaboratoryService _laboratoryService;
        private IFileService _fileService;

        public LaboratoriesController(ILaboratoryService laboratoryService, IFileService fileService)
        {
            _laboratoryService = laboratoryService;
            _fileService = fileService;
        }
        [HttpGet]
   
        public async Task<ActionResult<IEnumerable<LaboratoryModel>>> GetLaboratoriesAsync(string orderBy = "Id")
        {
            try
            {
                var laboratories = await _laboratoryService.GetLaboratoriesAsync(orderBy);
                return Ok(laboratories);
            }
            catch (NotFoundElementException ex)
            {
                return NotFound(ex.Message);
            }
            catch (InvalidElementOperationException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Simething happend.");
            }
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<LaboratoryModel>> GetLaboratoryAsync(int id)
        {
            try
            {
                var laboratory = await _laboratoryService.GetLaboratoryAsync(id);
                return Ok(laboratory);
            }
            catch (NotFoundElementException ex)
            {
                return NotFound(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Something happend.");
            }
        }

        [HttpPost]
        public async Task<ActionResult<LaboratoryModel>> PostLaboratoryAsync([FromForm] LaboratoryFormModel laboratory)
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest(ModelState);

                var file = laboratory.Image;
                string imagePath = _fileService.UploadFile(file);

                laboratory.ImagePath = imagePath;

                var newLaboratory = await _laboratoryService.CreateLaboratoryAsync(laboratory);
                return Created($"/api/laboratories/{newLaboratory.Id}", newLaboratory);
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

        [HttpDelete("{laboratoryId:int}")]
        public async Task<ActionResult> DeleteLaboratoryAsync(int laboratoryId)
        {
            try
            {
                await _laboratoryService.DeleteLaboratoryAsync(laboratoryId);
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

        [HttpPut("{laboratoryId:int}")]
        public async Task<ActionResult<LaboratoryModel>> PutLaboratoryAsync(int laboratoryId, [FromForm] LaboratoryFormModel laboratory)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    if (laboratory.Address != null && ModelState.ContainsKey("address") && ModelState["address"].Errors.Count > 0)
                    {
                        return BadRequest(ModelState["address"].Errors);
                    }
                }

                var file = laboratory.Image;
                string imagePath = _fileService.UploadFile(file);

                laboratory.ImagePath = imagePath; 

                var updatedLaboratory = await _laboratoryService.UpdateLaboratoryAsync(laboratoryId, laboratory);
                return Ok(updatedLaboratory);
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
