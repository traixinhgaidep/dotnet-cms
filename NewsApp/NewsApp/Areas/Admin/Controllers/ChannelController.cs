using Models;
using Models.EF;
using System;
using System.Web.Mvc;

namespace NewsApp.Areas.Admin.Controllers
{
    public class ChannelController : Controller
    {
        // GET: Admin/Channel
        public ActionResult Index(int page = 1, int pageSize = 4)
        {
            var listchannel = new ChannelModel().ListAllPaging(page,pageSize);
            return View(listchannel);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Channel ochannel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    int idChannel = new ChannelModel().Create(ochannel);
                    if (idChannel > 0)
                    {                       
                        return RedirectToAction("Index", "Channel");
                    }
                }
                else
                {
                    ModelState.AddModelError("", StringResource.ErrorAddChannel);
                }               
            }
            catch(Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
            }
            return View(ochannel);
        }

        public ActionResult Edit(int id)
        {
            var channel = new ChannelModel().ViewDetail(id);
            return View(channel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Channel newchannel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var model = new ChannelModel();
                    bool res = model.Update(newchannel);
                    if (res)
                    {
                        return RedirectToAction("Index", "Channel");
                    }
                }
                else
                {
                    ModelState.AddModelError("", StringResource.ErrorEditChannel);
                }              
            }
            catch(Exception e)
            {
                ModelState.AddModelError("", e.Message);
            }
            return View(newchannel);
        }

        public ActionResult Delete(int id)
        {
            new ChannelModel().Delete(id);
            return RedirectToAction("Index", "Channel");
        }
    }
}