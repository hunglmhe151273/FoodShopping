using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyProjectWeb.Logic;
using MyProjectWeb.Models;
using System;
using System.Collections.Generic;
using System.Text.Json;

namespace MyProjectWeb.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult List()
        {
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

                //category va sub san pham cua no
                CategoryManager Dbcates = new CategoryManager();
                List<Category> cates = Dbcates.GetAllCategoryAndSub(rid);

                return View(cates);
            }
            catch (Exception)
            {
                return Redirect("/Region/ChooseRegion");
            }
            
            
        }
    }
}
