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

            routes.MapRoute(
               name: "Admin",
               url: "Admin/{controller}/{action}/{id}",
               defaults: new { action = "Index", controller = "Home", id = UrlParameter.Optional },
               namespaces: new[] { "NewsApp.Areas.Admin" }
            );

            routes.MapRoute(
                name: "FrontendChannel",
                url: "Frontend/{controller}/{action}/{id}",
                defaults: new { action = "ListArticleByChannel", controller = "Channel", id = UrlParameter.Optional },
                namespaces: new[] { "NewsApp.Areas.Frontend" }
            );

            routes.MapRoute(
                name: "FrontendArticle",
                url: "Frontend/{controller}/{action}/{id}",
                defaults: new { action = "ViewArticle", controller = "Article", id = UrlParameter.Optional },
                namespaces: new[] { "NewsApp.Areas.Frontend" }
            );

            routes.MapRoute(
                name: "Defautl",
                url: "Frontend/{controller}/{action}/{id}",
                defaults: new { action = "Index", controller = "Home", id = UrlParameter.Optional },
                namespaces: new[] { "NewsApp" }
            );
        }
    }
}
