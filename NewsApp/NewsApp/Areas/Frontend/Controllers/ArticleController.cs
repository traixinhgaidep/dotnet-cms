using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewsApp.Areas.Frontend.Controllers
{
    public class ArticleController : Controller
    {
        // GET: Frontend/Article
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ViewArticle(int id)
        {
            var article = new ArticleModel().ViewDetail(id);
            var channel = new ChannelModel().ViewDetail(Convert.ToInt32(article.IDChannel));
            ViewBag.NameChannel = channel.Name;
            var listArticle = new ArticleModel().ListArticleByChannel(3, Convert.ToInt32(article.IDChannel), id);
            ViewBag.ListArticle = listArticle;
            return View(article);
        }
    }
}