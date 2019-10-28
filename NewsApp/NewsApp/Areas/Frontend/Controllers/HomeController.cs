using Models;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewsApp.Areas.Frontend.Controllers
{
    public class HomeController : Controller
    {
        // GET: Frontend/Home
        public ActionResult Index()
        {
            var channel = new ChannelModel().ListAll();
            List<List<Article>> listArticle = new List<List<Article>>();
            foreach (var item in channel)
            {
                listArticle.Add(new ArticleModel().ListArticleByChannel(5, item.IDChannel));
            }
            ViewBag.Article = listArticle;
            return View(channel);
        }

        [ChildActionOnly]
        public ActionResult LeftMenu()
        {
            var dao = new ChannelModel();
            var channel = dao.ListAll();
            return PartialView(channel);
        }
    }
}