using Models.EF;
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
    }
}
