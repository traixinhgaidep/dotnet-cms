using System.Web.Optimization;

namespace NewsApp.Areas.Admin
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));
            bundles.Add(new StyleBundle("~/Assets/Admin/css").Include(
                      "~/Assets/Admin/bower_components/bootstrap/dist/css/bootstrap.min.css",
                      "~/Assets/Admin/bower_components/font-awesome/css/font-awesome.min.css",
                      "~/Assets/Admin/bower_components/Ionicons/css/ionicons.min.css",
                      "~/Assets/Admin/dist/css/AdminLTE.min.css",
                      "~/Assets/Admin/dist/css/skins/_all-skins.min.css",
                      "~/Assets/Admin/bower_components/morris.js/morris.css",
                      "~/Assets/Admin/bower_components/jvectormap/jquery-jvectormap.css",
                      "~/Assets/Admin/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css",
                      "~/Assets/Admin/bower_components/bootstrap-daterangepicker/daterangepicker.css",
                      "~/Assets/Admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
                ));

            bundles.Add(new ScriptBundle("~/Admin/bundles/jquery").Include(
                      "~/Assets/Admin/bower_components/jquery/dist/jquery.min.js",
                      "~/Assets/Admin/bower_components/jquery-ui/jquery-ui.min.js"
                ));

            bundles.Add(new ScriptBundle("~/Admin/bundles/unobtrusive-ajax").Include(
                      "~/Scripts/jquery.unobtrusive-ajax.min.js"
                ));
            bundles.Add(new ScriptBundle("~/Admin/bundles/bootstrap").Include(
                      "~/Assets/Admin/bower_components/bootstrap/dist/js/bootstrap.min.js"
                ));

            bundles.Add(new ScriptBundle("~/Admin/bundles/adminlte").Include(
                      "~/Assets/Admin/dist/js/adminlte.min.js"
                ));

            bundles.Add(new ScriptBundle("~/Admin/bundles/ckfinder").Include(
                      "~/Assets/Admin/plugins/ckfinder/ckfinder.js"
                ));
        }

    }
}
