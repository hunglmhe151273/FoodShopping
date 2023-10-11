using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class GroupFeature
    {
        public int Gid { get; set; }
        public int Fid { get; set; }

        public virtual Feature FidNavigation { get; set; }
        public virtual Group GidNavigation { get; set; }
    }
}
