using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class Account
    {
        public Account()
        {
            GroupAccounts = new HashSet<GroupAccount>();
        }

        public string Username { get; set; }
        public string Password { get; set; }

        public virtual ICollection<GroupAccount> GroupAccounts { get; set; }
    }
}
