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
    }
}