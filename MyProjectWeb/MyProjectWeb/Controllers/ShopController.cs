using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using MyProjectWeb.Logic;
using MyProjectWeb.Models;
using System;
using System.Collections.Generic;
using System.Text.Json;
using Microsoft.Extensions.Configuration;

namespace MyProjectWeb.Controllers
{
    public class ShopController : Controller
    {
        //co the lam template
        private readonly IConfiguration configuration;

        public ShopController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public IActionResult List(int cid, int subid, int page)//cid=1}/{subid=0}/{page=1}
        {
            if (page == 0)
            {
                page = 1;
            }
            //get du lieu json tu session
            string jsonData = HttpContext.Session.GetString("region");
            Region curregion = new Region();
            //Deseriallize du lieu jsonData -> student
            try
            {
                curregion = JsonSerializer.Deserialize<Region>(jsonData);
                //curregion
                int rid = curregion.Rid;
                ViewBag.curRegion = curregion;
                //regions
                RegionManager Rdb = new RegionManager();
                List<Region> regions = Rdb.GetAllRegions();
                ViewBag.Regions = regions;

                //lay san pham theo cate
                CategoryManager Dbcates = new CategoryManager();
                List<Category> cates = Dbcates.GetAllCategoryAndSub(rid);
                ViewBag.Categories = cates;

                //San pham theo cate, sub
                int pagesize = Convert.ToInt32(configuration.GetValue<string>("Appsettings:Pagesize"));
                ProductManagement productManager = new ProductManagement();
                List<Product> products = productManager.GetProducts(rid, cid, subid, (page - 1) * pagesize + 1, pagesize);
                
                //lay du lieu de hien thi thanh pager
                int TotalProduct = productManager.GetNumberOfProduct(rid, cid, subid);
                int TotalPage = TotalProduct / pagesize;

                if (TotalProduct % pagesize != 0)
                {
                    TotalPage++;
                }

                ViewData["TotalPage"] = TotalPage;
                ViewData["TotalProduct"] = TotalProduct;
                ViewData["CurrentPage"] = page;
                ViewData["CurrentCate"] = cid;
                ViewData["SubCate"] = subid;

                return View(products);
            }
            catch (Exception)
            {
                return Redirect("/Region/ChooseRegion");
            }
        }
        public IActionResult AddToCart(String cUrl, int pid, int cid, int subid, int page)//{pid}/{cid=1}/{subid=0}/{page=1}
        {
            if (page == 0)
            {
                page = 1;
            }

            string cart = HttpContext.Session.GetString("cart");
            Dictionary<int, int> mycart = new Dictionary<int, int>();
            //lay product ve, ktra session
            if (cart == null)
            {
                mycart.Add(pid,1);
                //dem s seriallize thanh 1 xau Json
                string jsonData = JsonSerializer.Serialize(mycart);
                //dem du lieu jsonData luu vao trong Session
                HttpContext.Session.SetString("cart", jsonData);
            }
            else
            {
                //Deseriallize du lieu jsonData -> Dictionary
                mycart = JsonSerializer.Deserialize<Dictionary<int, int>>(cart);

                if (mycart.ContainsKey(pid))
                {
                    mycart[pid] +=1;
                }
                else
                {
                    mycart.Add(pid,1);
                }
            }
            int count = 0;
            foreach (KeyValuePair<int, int> item in mycart)
            {
                count = count + item.Value;
            }
            //dem s seriallize thanh 1 xau Json
            string soluong = JsonSerializer.Serialize(count);

            //dem du lieu jsonData luu vao trong Session
            HttpContext.Session.SetString("count", soluong);

            return Redirect("../../"+cUrl + "List/" + cid + "/" + subid + "/" + page );// set vao xong sesssion, quay lai trang list
        }

        public IActionResult ViewCart()
        {
            string cart = HttpContext.Session.GetString("cart");
            List<Item> items = new List<Item>();
            ProductManagement pdb = new ProductManagement();
            int totalprice = 0;
            if (cart == null) 
            { 
                Dictionary<int, int> mycart = new Dictionary<int, int>();
                //lay product ve, ktra session
            
                foreach (KeyValuePair<int, int> item in mycart)
                {
                    Product p = pdb.GetProductByPid(item.Key);
                    int quantity = item.Value;
                    int total = quantity * (int)p.UnitPrice;
                    totalprice += total;
                    Item i = new Item(p, quantity,total);
                    items.Add(i);
                }
            }
            ViewData["totalprice"] = totalprice;
            return View(items);
        }   
    }
}
