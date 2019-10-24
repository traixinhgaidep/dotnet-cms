using Models;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NewsApp.Areas.Admin.Controllers
{
    public class ChannelController : Controller
    {
        // GET: Admin/Channel
        public ActionResult Index()
        {
            var channel = new ChannelModel().ListAll();
            return View(channel);
        }

        public void SetViewBag(int? selectedId = null)
        {
            var channel = new ChannelModel();
            ViewBag.IDChannel = new SelectList(channel.ViewChannelID(), "IDChannel", "Name", selectedId);
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        public ActionResult Create(Channel collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    int idChannel = new ChannelModel().Create(collection);
                    if (idChannel > 0)
                    {
                        return RedirectToAction("Index", "Channel");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Thêm danh mục báo không thành công.");
                }
                return View(collection);
            }
            catch(Exception ex)
            {
                SetViewBag();
                return View();
            }
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var channel = new ChannelModel().ViewDetail(id);
            return View(channel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Channel collection)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new ChannelModel();
                    bool res = model.Update(collection);
                    if (res)
                    {
                        return RedirectToAction("Index", "Channel");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Sửa danh mục báo không thành công");
                }
                return View(collection);
            }
            catch
            {
                return View();
            }
        }

        public ActionResult Delete(int id)
        {
            new ChannelModel().Delete(id);
            return RedirectToAction("Index", "Channel");
        }
    }
}