using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class Group
    {
        public Group()
        {
            GroupAccounts = new HashSet<GroupAccount>();
            GroupFeatures = new HashSet<GroupFeature>();
        }

        public int Gid { get; set; }
        public string Gname { get; set; }

        public virtual ICollection<GroupAccount> GroupAccounts { get; set; }
        public virtual ICollection<GroupFeature> GroupFeatures { get; set; }
    }
}
