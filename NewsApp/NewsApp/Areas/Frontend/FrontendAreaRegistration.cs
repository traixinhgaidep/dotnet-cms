using System.Web.Mvc;

namespace NewsApp.Areas.Frontend
{
    public class FrontendAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Frontend";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Frontend_default",
                "{controller}/{action}/{id}",
                new { action = "Index", controller="Home", id = UrlParameter.Optional }
            );
        }
    }
}