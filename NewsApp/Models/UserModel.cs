using Models.EF;
using PagedList;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace Models
{
    public class UserModel
    {
        NewsAppDbContext context = null;

        public UserModel()
        {
            context = new NewsAppDbContext();
        }

        public IEnumerable<AspNetUser> ListAllPagging(int page, int pageSize)
        {
            return context.AspNetUsers.OrderByDescending(x => x.Id).ToPagedList(page, pageSize);
        }

        public List<SelectListItem> ListAllRoles()
        {
            List<SelectListItem> listRoles = new List<SelectListItem>();
            var roles = context.AspNetRoles.ToList();
            foreach (var item in roles)
            {
                listRoles.Add(new SelectListItem
                {
                    Text = item.Name.ToString(),
                    Value = item.Id.ToString()
                });
            }
            return listRoles;
        }

        public List<SelectListItem> SelectListRoles(string id)
        {
            var oUser = FindUserById(id);
            List<SelectListItem> listRoles = ListAllRoles();
            
            string role = "";
            string roles = oUser.UserRole;
            while (roles.Length > 0)
            {
                role = roles.Substring(0, roles.IndexOf(','));
                foreach (var item in listRoles)
                {
                    if (role == item.Text)
                    {
                        item.Selected = true;
                        break;
                    }
                }
                roles = roles.Substring(roles.IndexOf(',') + 1);
            }
            return listRoles;
        }

        public List<string> ListUserRoles(string id)
        {
            var oUser = FindUserById(id);
            List<string> listRoles = new List<string>();

            string role = "";
            string roles = oUser.UserRole;
            while (roles.Length > 0)
            {
                role = roles.Substring(0, roles.IndexOf(','));
                listRoles.Add(role);
                roles = roles.Substring(roles.IndexOf(',') + 1);
            }
            return listRoles;
        }

        public string ViewRoles(string id)
        {
            return context.AspNetUsers.Find(id).UserRole;
        }

        public AspNetUser FindUserById(string id)
        {
            return context.AspNetUsers.Find(id);
        }

        public bool Update(AspNetUser nUser)
        {
            try
            {
                var oUser = context.AspNetUsers.Find(nUser.Id);
                oUser.Image = nUser.Image;
                oUser.PhoneNumber = nUser.PhoneNumber;
                oUser.UserRole = nUser.UserRole;
                context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(string id)
        {
            try
            {
                AspNetUser dUser = context.AspNetUsers.Find(id);
                context.AspNetUsers.Remove(dUser);
                context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
