using Models.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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

        public List<AspNetRole> ListAllRoles()
        {
            return context.AspNetRoles.ToList();
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
                oUser.UserRole = nUser.UserRole;
                context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool UpdateRole(string IdUser, string Role)
        {
            try
            {
                //var oUserRole = context.AspNetUserRoles.SingleOrDefault(x => x.UserId == IdUser);
                var oRole = context.AspNetRoles.SingleOrDefault(x => x.Name == Role);
                //oUserRole.RoleId = oRole.Id;
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
