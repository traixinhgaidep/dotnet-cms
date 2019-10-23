using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaoDienTu.Controllers
{
    public class ChannelController : Controller
    {
        // GET: Channel
        public ActionResult Index(int id)
        {
            var channel = new ChannelModel().FindName(id);
            ViewBag.NameChannel = channel.Name;
            return View();
        }

        public ActionResult CategogyChannel(string name, int id)
        {
            var listArticle = new ArticleModel().ListArticleByChannel(id);
            return View(listArticle);
        }
    }
}