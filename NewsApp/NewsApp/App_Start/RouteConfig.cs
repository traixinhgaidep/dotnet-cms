using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace NewsApp
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            

           // routes.MapRoute(
           //    name: "Admin_default",
           //    url: "Admin/{controller}/{action}/{id}",
           //    defaults: new { action = "Index", controller = "Login", id = UrlParameter.Optional },
           //    namespaces: new[] { "BaoDienTu.Areas" }
           //);

            routes.MapRoute(
                 name: "Channel",
                 url: "Channel/{name}-{id}",
                 defaults: new { controller = "Channel", action = "CategogyChannel", id = UrlParameter.Optional },
                 namespaces: new[] { "BaoDienTu.Controllers" }
             );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional  },
                namespaces: new[] { "BaoDienTu.Controllers" }
            );
        }
    }
}
