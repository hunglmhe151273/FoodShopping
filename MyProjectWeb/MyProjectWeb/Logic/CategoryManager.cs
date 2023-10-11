using MyProjectWeb.Models;
using System.Collections.Generic;
using System.Linq;

namespace MyProjectWeb.Logic
{
    public class CategoryManager
    {
        public List<Category> GetAllCategoryAndSub(int rid)
        {
            List<Category> Categories = new List<Category>();
            var context = new ProjectPRJContext();
            Categories = context.Categories.ToList();

            SubCategoryManager Sdb = new SubCategoryManager();
            foreach (var category in Categories)
            {
                category.SubCategories = Sdb.GetAllSubByCateId(category.Id, rid);
            }
            return Categories;

        }
    }
}
