using MyProjectWeb.Models;
using System;

namespace MyProjectWeb.Validation
{
    public class Validation
    {
        public static Boolean CheckCateKhacNull(Category c)
        {
            int count = 0;
            foreach (SubCategory sub in c.SubCategories)
            {
                foreach (Product p in sub.Products)
                {
                    count += 1;
                }
            }
            if (count != 0) return true;
            else return false;
        }

        public static Boolean CheckSubKhacNull(SubCategory sub)
        {
            int count = 0;

            foreach (Product p in sub.Products)
            {
                count += 1;
            }

            if (count != 0) return true;
            else return false;
        }
    }
}
