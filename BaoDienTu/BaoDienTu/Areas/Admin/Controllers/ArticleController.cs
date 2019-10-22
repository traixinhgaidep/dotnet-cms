﻿using Models;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//using PagedList;

namespace BaoDienTu.Areas.Admin.Controllers
{
    public class ArticleController : BaseController
    {
        // GET: Admin/Article
        public ActionResult Index(int page = 1, int pageSize = 5)
        {
            var iplArticle = new ArticleModel();
            //var model = iplArticle.ListAll(page,pageSize);
            var model = iplArticle.ListAll();
            return View(model);
        }

        // GET: Admin/Article/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/Article/Create
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        public void SetViewBag(int? selectedId = null)
        {
            var article = new ArticleModel();
            ViewBag.IDChannel = new SelectList(article.ViewChannelID(), "IDChannel", "Name", selectedId);
        }

        // POST: Admin/Article/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Article collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new ArticleModel();
                    int id = model.Create(collection);
                    if(id > 0)
                    {
                        return RedirectToAction("Index", "Article");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Them bao khong thanh cong");
                }
                return View(collection);
            }
            catch
            {
                SetViewBag();
                return View();
            }
        }

        // GET: Admin/Article/Edit/5
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var article = new ArticleModel().ViewDetail(id);

            return View(article);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Article collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new ArticleModel();
                    bool res = model.Update(collection);
                    if (res)
                    {
                        return RedirectToAction("Index", "Article");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Sửa báo không thành công");
                }
                return View(collection);
            }
            catch
            {
                return View();
            }
        }


        // GET: Admin/Article/Delete/5
        public ActionResult Delete(int id)
        {
            new ArticleModel().Delete(id);
            return RedirectToAction("Index","Article");
        }
    }
}
