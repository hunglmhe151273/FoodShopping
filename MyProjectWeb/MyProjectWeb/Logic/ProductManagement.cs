using MyProjectWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace MyProjectWeb.Logic

{
    public class ProductManagement
    {
        List<Product> products = new List<Product>();
        List<ProductRegion> productRegions = new List<ProductRegion>();
        List<Region> regions = new List<Region>();
        List<Category> categories = new List<Category>();
        List<SubCategory> subCategories = new List<SubCategory>();

        public Product GetProductByPid(int pid)
        {
            var context = new ProjectPRJContext();
            products = context.Products.ToList();
            var result = (from p in products
                          where p.Id == pid
                          select p).FirstOrDefault();

            return result;
        }
        public List<Product> GetAllProductBySid(int sid, int rid)
        {
            var context = new ProjectPRJContext();
            products = context.Products.ToList();
            productRegions = context.ProductRegions.ToList();
            regions = context.Regions.ToList();
            var result = (from p in products
                          join Rpro in productRegions on p.Id equals Rpro.Pid
                          join r in regions on Rpro.Rid equals r.Rid
                          where p.SubCategoryId == sid && r.Rid == rid
                          select p).Take(4).ToList();

            return result;
        }
        public List<Product> GetProducts(int rid , int CategoryId,int SubId, int offset, int count)// lay ra cac product trong page
        {
            using (var context = new ProjectPRJContext())
            {
                products = context.Products.ToList();
                categories = context.Categories.ToList();
                subCategories = context.SubCategories.ToList();
                productRegions = context.ProductRegions.ToList();
                regions = context.Regions.ToList();
                var result= products;
                if (SubId == 0)
                {
                    result = (from p in products
                                  join sub in subCategories on p.SubCategoryId equals sub.Id
                                  join cate in categories on sub.CategoryId equals cate.Id
                                  where cate.Id == CategoryId && p.Any(
                                  from p in products
                                  join Rpro in productRegions on p.Id equals Rpro.Pid
                                  join r in regions on Rpro.Rid equals r.Rid
                                  where r.Rid == rid
                                  select p)
                                  select p).Skip(offset - 1).Take(count).ToList();
                    return result;
                }
                else
                {
                    result = (from p in products
                              join sub in subCategories on p.SubCategoryId equals sub.Id
                              join cate in categories on sub.CategoryId equals cate.Id
                              where sub.Id == SubId && p.Any(
                              from p in products
                              join Rpro in productRegions on p.Id equals Rpro.Pid
                              join r in regions on Rpro.Rid equals r.Rid
                              where r.Rid == rid
                              select p)
                              select p).Skip(offset - 1).Take(count).ToList();
                    return result;
                }
                    
            }
        }
        public int GetNumberOfProduct(int rid, int CategoryId, int SubId)
        {
            using (var context = new ProjectPRJContext())
            {
                products = context.Products.ToList();
                categories = context.Categories.ToList();
                subCategories = context.SubCategories.ToList();
                var result = products;
                if (SubId == 0)
                {

                    result = (from p in products
                              join sub in subCategories on p.SubCategoryId equals sub.Id
                              join cate in categories on sub.CategoryId equals cate.Id
                              where cate.Id == CategoryId && p.Any(
                              from p in products
                              join Rpro in productRegions on p.Id equals Rpro.Pid
                              join r in regions on Rpro.Rid equals r.Rid
                              where r.Rid == rid
                              select p)
                              select p).ToList();
                    return result.Count;
                }
                else
                {
                    result = (from p in products
                              join sub in subCategories on p.SubCategoryId equals sub.Id
                              join cate in categories on sub.CategoryId equals cate.Id
                              where sub.Id == SubId && p.Any(
                              from p in products
                              join Rpro in productRegions on p.Id equals Rpro.Pid
                              join r in regions on Rpro.Rid equals r.Rid
                              where r.Rid == rid
                              select p)
                              select p).ToList();
                    return result.Count;

                }
            }
        }
    }
}
