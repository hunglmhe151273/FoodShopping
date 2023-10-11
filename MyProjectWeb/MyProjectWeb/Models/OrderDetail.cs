using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class OrderDetail
    {
        public string OrderId { get; set; }
        public int ProductId { get; set; }
        public double? SalePrice { get; set; }
        public int? Quantity { get; set; }
        public double? Discount { get; set; }
        public double? Profit { get; set; }

        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
