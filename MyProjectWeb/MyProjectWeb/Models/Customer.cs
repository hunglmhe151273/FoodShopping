using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Orders = new HashSet<Order>();
        }

        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public double? PostalCode { get; set; }
        public string PhoneNumber { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
