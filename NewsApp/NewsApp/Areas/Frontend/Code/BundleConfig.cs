using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Optimization;

namespace NewsApp.Areas.Frontend
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/Frontend/css").Include(
                "~/Assets/Frontend/css/bootstrap.css",
                "~/Assets/Frontend/css/style.css",
                "~/Assets/Frontend/css/flexslider.css"
                ));

            bundles.Add(new ScriptBundle("~/Frontend/script").Include(
                "~/Assets/Frontend/js/jquery.min.js"
                ));
        }
    }
}