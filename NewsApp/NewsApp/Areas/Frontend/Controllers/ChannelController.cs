using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewsApp.Areas.Frontend.Controllers
{
    public class ChannelController : Controller
    {
        // GET: Frontend/Channel
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListArticleByChannel(int id)
        {
            int page = 1; int pageSize = 5;
            var listArticle = new ArticleModel().ListAllPagingByChannel(id, page, pageSize);
            //ViewBag.NameChannel = name;
            return View(listArticle);
        }
    }
}