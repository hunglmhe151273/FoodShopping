using System;
using System.Collections.Generic;

#nullable disable

namespace MyProjectWeb.Models
{
    public partial class Product
    {
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
            ProductRegions = new HashSet<ProductRegion>();
        }

        public int Id { get; set; }
        public string ProductName { get; set; }
        public int? UnitPrice { get; set; }
        public int? SubCategoryId { get; set; }
        public string Img { get; set; }

        public virtual SubCategory SubCategory { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<ProductRegion> ProductRegions { get; set; }
    }
}
