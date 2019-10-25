using Models;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewsApp.Areas.Admin.Controllers
{
    public class ArticleController : Controller
    {
        // GET: Admin/Article
        public ActionResult Index()
        {
            var listArticle = new ArticleModel().ListAll();
            return View(listArticle);
        }

        public void SetViewBag(int? selectedID = null)
        {
            var article = new ArticleModel();
            ViewBag.IDChannel = new SelectList(article.ViewArticleID(), "IDChannel", "Name", selectedID);
        }
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Article oArticle)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    int articleID = new ArticleModel().Create(oArticle);
                    if (articleID > 0)
                    {
                        return RedirectToAction("Index", "Article");
                    }
                    else
                    {
                        ModelState.AddModelError("", StringResource.ErrorAddArticle);
                    }
                }
                
            }
            catch(Exception e)
            {
                ModelState.AddModelError("", e.Message);
            }
            return View(oArticle);
        }
    }
}