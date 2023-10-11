using System;
using MyProjectWeb.Models;
using System.Linq;
using System.Collections.Generic;

namespace MyProjectWeb
{
    static class ProductExtentions
    {
        public static Boolean Any(this Product p, IEnumerable<Product> products)
        {
            List<Product> products1 = products.ToList();
            foreach (Product product in products1)
            {
                if(p.Id == product.Id) {
                    return true;
                    }
            }
            return false;
        }
    }
}
