using Models.EF;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ArticleModel
    {
        private BaoDienTuDBContext context = null;
        public ArticleModel()
        {
            context = new BaoDienTuDBContext();
        }

        public List<Article> ListAll()
        {
            var list = context.Database.SqlQuery<Article>("Sp_Article_ListAll").ToList();
            return list;
        }

        public int Create(Article entity)
        {
            context.Articles.Add(entity);
            context.SaveChanges();
            return entity.IDArticle;
        }

         
    }
}
