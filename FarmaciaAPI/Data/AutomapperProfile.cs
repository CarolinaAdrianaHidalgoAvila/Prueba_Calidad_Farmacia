using AutoMapper;
using FarmaciaAPI.Data.Entities;
using FarmaciaAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FarmaciaAPI.Data
{
    public class AutomapperProfile : Profile
    {
        public AutomapperProfile()
        {
            this.CreateMap<LaboratoryEntity, LaboratoryModel>()
                //.ForMember( des => des.Phone, opt => opt.MapFrom(src => src.Phone + "#" + src.Name ))
                .ReverseMap();

            this.CreateMap<ProductEntity, ProductModel>()
                .ForMember(mod => mod.LaboratoryId, ent => ent.MapFrom(entSrc => entSrc.Laboratory.Id))
                .ReverseMap()
                .ForMember(ent => ent.Laboratory, mod => mod.MapFrom(modSrc => new LaboratoryEntity() { Id = modSrc.LaboratoryId }));

        }
    }
}
