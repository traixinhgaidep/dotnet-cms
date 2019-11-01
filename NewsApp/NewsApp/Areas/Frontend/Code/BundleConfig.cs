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
                "~/Areas/Frontend/Content/css/bootstrap.css",
                "~/Areas/Frontend/Content/css/style.css",
                "~/Areas/Frontend/Content/css/flexslider.css"
                ));

            bundles.Add(new ScriptBundle("~/Frontend/script").Include(
                "~/Areas/Frontend/Content/js/jquery.min.js"
                ));
        }
    }
}