using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class Feature
    {
        public Feature()
        {
            GroupFeatures = new HashSet<GroupFeature>();
        }

        public int Fid { get; set; }
        public string Url { get; set; }

        public virtual ICollection<GroupFeature> GroupFeatures { get; set; }
    }
}
