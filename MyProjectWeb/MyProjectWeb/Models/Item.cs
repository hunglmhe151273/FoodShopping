
using MyProjectWeb.Models;
using System.Collections.Generic;
using System.Linq;

namespace MyProjectWeb.Models
{
    public class Item
    {
        public Product product { get; set; }
        public int quantity { get; set; }
        public int Totalprice { get; set; }

        public Item(Product product, int quantity, int totalprice)
        {
            this.product = product;
            this.quantity = quantity;
            Totalprice = totalprice;
        }
    }
}
