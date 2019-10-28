using Models.EF;
using PagedList;
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

        public IEnumerable<Article> ListAllPaging(int page, int pageSize)
        {
            return context.Articles.OrderByDescending(x => x.Date).ToPagedList(page, pageSize);
        }

        public List<Article> ListArticleByChannel(int top, int idChannel)
        {
            return context.Articles.Where(x => x.IDChannel == idChannel).OrderByDescending(x => x.Date).Take(top).ToList();
        }

        public IEnumerable<Article> ListAllPagingByChannel(int idChannel,int page,int pageSize)
        {
            return context.Articles.Where(x => x.IDChannel == idChannel).OrderByDescending(x => x.Date).ToPagedList(page, pageSize);
        }

        public int Create(Article oArticle)
        {
            oArticle.Date = DateTime.Now;
            context.Articles.Add(oArticle);
            context.SaveChanges();
            return oArticle.IDArticle;
        }

        public List<Channel> ViewArticleID()
        {
            return context.Channels.ToList();
        }

        public bool Update(Article newArticle)
        {
            try
            {
                var oArticle = context.Articles.Find(newArticle.IDArticle);
                oArticle.Title = newArticle.Title;
                oArticle.Image = newArticle.Image;
                oArticle.Summary = newArticle.Summary;
                oArticle.Content = newArticle.Content;
                oArticle.Author = newArticle.Author;
                oArticle.Date = DateTime.Now;
                context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public Article ViewDetail(int id)
        {
            return context.Articles.Find(id);
        }

        public bool Delete(int id)
        {
            try
            {
                var article = context.Articles.Find(id);
                context.Articles.Remove(article);
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
