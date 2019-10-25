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

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
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
                    ModelState.AddModelError("", StringResource.ErrorAddChannel);
                }
                return View(collection);
            }
            catch(Exception ex)
            {
                return View();
            }
        }

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
                    ModelState.AddModelError("", StringResource.ErrorEditChannel);
                }
                return View(collection);
            }
            catch(Exception e)
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