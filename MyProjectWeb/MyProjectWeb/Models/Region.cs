using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class Region
    {
        public Region()
        {
            ProductRegions = new HashSet<ProductRegion>();
        }

        public int Rid { get; set; }
        public string Name { get; set; }

        public virtual ICollection<ProductRegion> ProductRegions { get; set; }
    }
}
