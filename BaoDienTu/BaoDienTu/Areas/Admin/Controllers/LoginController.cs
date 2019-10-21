using BaoDienTu.Areas.Admin.Code;
using BaoDienTu.Areas.Admin.Models;
using BaoDienTu.Common;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BaoDienTu.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Index()
        {
            //if(Membership.ValidateUser(model.Email, model.Password) && ModelState.IsValid)
            //{
            //    FormsAuthentication.SetAuthCookie(model.Email, model.RememberMe);
            //    return RedirectToAction("Index", "Home");
            //}
            //else
            //{
            //    ModelState.AddModelError("", "Ten dang nhap hoac mat khau khong dung");
            //}
            
            return View();
        }

        [HttpPost]
        public ActionResult Index(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new AccountModel();
                var result = dao.Login(model.Email, Encrytor.MD5Hash(model.Password));
                if (result == 1)
                {
                    var user = dao.GetByEmail(model.Email);
                    var userSession = new UserLogin();
                    userSession.Email = user.Email;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Channel");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tai khoan khong ton tai.");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Mat khau khong dung.");
                }                
                else
                {
                    ModelState.AddModelError("", "Dang nhap khong thanh cong.");
                }
            }
            return View(model);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Login");
        }
    }
}