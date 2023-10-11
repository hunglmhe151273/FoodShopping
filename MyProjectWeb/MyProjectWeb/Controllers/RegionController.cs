using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyProjectWeb.Logic;
using MyProjectWeb.Models;
using System;
using System.Collections.Generic;
using System.Text.Json;

namespace MyProjectWeb.Controllers
{
    public class RegionController : Controller
    {
        public IActionResult ChooseRegion()
        {
            //thieu lay url
            RegionManager db = new RegionManager();
            List<Region> regions = db.GetAllRegions();
            return View(regions);
        }
        public IActionResult SetRegion(string rid, String Rurl)
        {
            int crid = Convert.ToInt32(rid);
            //lay Id --> lay doi tuong region --> cho region vao trong session --> tra ve trang req
            RegionManager db = new RegionManager();
            Region r = db.GetRegionById(crid);
            
            //dem s seriallize thanh 1 xau Json
            string jsonData = JsonSerializer.Serialize(r);
            //dem du lieu jsonData luu vao trong Session
            HttpContext.Session.SetString("region", jsonData);
            return Redirect("/"+Rurl);
            
        }
    }
}

