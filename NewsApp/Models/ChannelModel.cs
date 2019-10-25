using Models.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ChannelModel
    {
        NewsAppDbContext context = null;

        public ChannelModel()
        {
            context = new NewsAppDbContext();
        }

        public List<Channel> ListAll()
        {
            return context.Channels.ToList();
        }

        public IEnumerable<Channel> ListAllPaging(int page, int pageSize)
        {
            return context.Channels.OrderBy(x => x.IDChannel).ToPagedList(page, pageSize);
        }

        public int Create(Channel entity)
        {
            context.Channels.Add(entity);
            context.SaveChanges();
            return entity.IDChannel;
        }


        public bool Update(Channel entity)
        {
            try
            {
                var channel = context.Channels.Find(entity.IDChannel);
                channel.Name = entity.Name;
                channel.Image = entity.Image;
                channel.Summary = entity.Summary;
                context.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }

        public Channel ViewDetail(int idChannel)
        {
            return context.Channels.Find(idChannel);
        }

        public bool Delete(int idChannel)
        {
            try
            {
                var channel = context.Channels.Find(idChannel);
                context.Channels.Remove(channel);
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
