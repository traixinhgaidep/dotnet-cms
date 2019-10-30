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
    }
}
