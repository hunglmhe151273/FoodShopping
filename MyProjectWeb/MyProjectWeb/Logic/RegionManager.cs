using MyProjectWeb.Models;
using System.Collections.Generic;
using System.Linq;

namespace MyProjectWeb.Logic
{
    public class RegionManager
    {
        public List<Region> GetAllRegions()
        {
            List<Region> regions = new List<Region>();
            var context = new ProjectPRJContext();
            regions = context.Regions.ToList();
            return regions;
            
        }
        public Region GetRegionById(int rid)
        {
            Region r = new Region();
            var context = new ProjectPRJContext();
            r = context.Regions.First(x=>x.Rid==rid);
            return r;
        }
    }
}
