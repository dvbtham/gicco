﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Gicco.Infrastructure.Models;

namespace Gicco.Module.Shipping.Models
{
    public class ShippingProvider : EntityBaseWithTypedId<string>
    {
        public ShippingProvider()
        {

        }

        public ShippingProvider(string id)
        {
            Id = id;
        }

        [Required]
        [StringLength(450)]
        public string Name { get; set; }

        public bool IsEnabled { get; set; }

        public string ConfigureUrl { get; set; }

        public bool ToAllShippingEnabledCountries { get; set; }

        public string OnlyCountryIdsString { get; set; }

        public IList<string> OnlyCountryIds
        {
            get
            {
                if (string.IsNullOrWhiteSpace(OnlyCountryIdsString))
                {
                    return new List<string>();
                }

                return OnlyCountryIdsString.Split(',').ToList();
            }
        }

        public bool ToAllShippingEnabledStatesOrProvinces { get; set; } 

        public string OnlyStateOrProvinceIdsString { get; set; }

        public IList<long> OnlyStateOrProvinceIds
        {
            get
            {
                if (string.IsNullOrWhiteSpace(OnlyStateOrProvinceIdsString))
                {
                    return new List<long>();
                }

                return OnlyStateOrProvinceIdsString.Split(',').Select(long.Parse).ToList();
            }
        }

        /// <summary>
        /// Additional setting for specific provider. Stored as json string.
        /// </summary>
        public string AdditionalSettings { get; set; }

        /// <summary>
        /// The type that 
        /// </summary>
        public string ShippingPriceServiceTypeName { get; set; }
    }
}
