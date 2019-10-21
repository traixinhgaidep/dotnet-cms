using Models.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
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

        //public IEnumerable<Article> ListAll(int page, int pageSize)
        //{
        //    return context.Articles.ToPagedList(page,pageSize);
        //}

        public List<Article> ListAll()
        {
            return context.Articles.ToList();
        }

        public List<Article> ListArticleByChannel(int top, int idChannel)
        {
            return context.Articles.Where(x => x.IDChannel == idChannel).OrderByDescending(x => x.Date).Take(top).ToList();
        }

        public List<Article> ListArticleByChannel(int idChannel)
        {
            return context.Articles.Where(x => x.IDChannel == idChannel).OrderByDescending(x => x.Date).ToList();
        }

        public int Create(Article entity)
        {
            context.Articles.Add(entity);
            context.SaveChanges();
            return entity.IDArticle;
        }

        public bool Update(Article entity)
        {
            try
            {
                var article = context.Articles.Find(entity.IDArticle);
                article.Title = entity.Title;
                article.IDChannel = entity.IDChannel;
                article.Image = entity.Image;
                article.Content = entity.Content;
                article.Author = entity.Author;
                article.Date = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
           
        }

        public bool Delete(int? idArticle)
        {
            try
            {
                var article = context.Articles.Find(idArticle);
                context.Articles.Remove(article);
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public Article ViewDetail(int id)
        {
            return context.Articles.Find(id);
        }

        public List<Channel> ViewChannelID()
        {
            return context.Channels.ToList();
        }
    }
}
