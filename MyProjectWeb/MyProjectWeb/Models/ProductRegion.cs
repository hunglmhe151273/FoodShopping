using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class ProductRegion
    {
        public int Pid { get; set; }
        public int Rid { get; set; }

        public virtual Product PidNavigation { get; set; }
        public virtual Region RidNavigation { get; set; }
    }
}
