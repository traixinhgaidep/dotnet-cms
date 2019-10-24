using Models;
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
    }
}