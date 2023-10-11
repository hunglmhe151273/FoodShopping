using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class GroupAccount
    {
        public int Gid { get; set; }
        public string Username { get; set; }

        public virtual Group GidNavigation { get; set; }
        public virtual Account UsernameNavigation { get; set; }
    }
}
