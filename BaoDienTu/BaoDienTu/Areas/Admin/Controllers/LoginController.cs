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
        public ActionResult Index(LoginModel model)
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
            
            if (ModelState.IsValid)
            {
                var dao = new AccountModel();
                var result = dao.Login(model.Email, Encrytor.MD5Hash(model.Password));
                if (result)
                {
                    var user = dao.GetByEmail(model.Email);
                    var userSession = new UserLogin();
                    userSession.Email = user.Email;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Email hoac mat khau khong dung");
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