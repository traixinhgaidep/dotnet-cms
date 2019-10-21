using Models;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaoDienTu.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
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

            //return View();
        }

        

        [ChildActionOnly]
        public ActionResult LeftMenu()
        {
            var dao = new ChannelModel();
            var channel = dao.ListAll();
            return PartialView(channel);
        }

        public ActionResult ListArticle()
        {
            var channel = new ChannelModel().ListAll();
            List<List<Article>> listArticle = new List<List<Article>>();
            foreach (var item in channel)
            {
                listArticle.Add(new ArticleModel().ListArticleByChannel(5, item.IDChannel));
            }
            return PartialView(listArticle);
        }
}
}