using MyProjectWeb.Models;
using System.Collections.Generic;
using System.Linq;
namespace MyProjectWeb.Logic
{
    public class SubCategoryManager
    {
        public List<SubCategory> GetAllSubByCateId(int cid,int rid)
        {
            List<SubCategory> SubCategories = new List<SubCategory>();
            var context = new ProjectPRJContext();
            SubCategories = context.SubCategories.Where(x=>x.CategoryId==cid).ToList();
            //lay ra tat ca san pham trong sub
            ProductManagement Pdb = new ProductManagement();
            foreach(var subCategory in SubCategories)
            {
                subCategory.Products = Pdb.GetAllProductBySid(subCategory.Id,rid);
            }

            return SubCategories;
        }
    }
}
