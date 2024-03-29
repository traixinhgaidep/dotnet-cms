﻿using Models;
using Models.EF;
using System;
using System.Web.Mvc;

namespace NewsApp.Areas.Admin.Controllers
{
    public class ArticleController : Controller
    {
        // GET: Admin/Article
        public ActionResult Index(int page = 1, int pageSize = 4)
        {
            var listArticle = new ArticleModel().ListAllPaging(page, pageSize);
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
                }
                else
                {
                    ModelState.AddModelError("", StringResource.ErrorAddArticle);
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", e.Message);
            }
            return View(oArticle);
        }

        public ActionResult Edit(int id)
        {
            var article = new ArticleModel().ViewDetail(id);
            return View(article);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit(Article newArticle)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var res = new ArticleModel().Update(newArticle);
                    if (res)
                    {
                        return RedirectToAction("Index", "Article");
                    }
                }
                else
                {
                    ModelState.AddModelError("", StringResource.ErrorEditArticle);
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
            }
            return View(newArticle);
        }

        public ActionResult Delete(int id)
        {
            new ArticleModel().Delete(id);
            return RedirectToAction("Index", "Article");
        }
    }
}