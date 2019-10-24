using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ArticleModel
    {
        NewsAppDbContext context = null;

        public ArticleModel()
        {
            context = new NewsAppDbContext();
        }

        public List<Article> ListAll()
        {
            return context.Articles.ToList();
        }
    }
}
