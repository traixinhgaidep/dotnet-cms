﻿using Models.EF;
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

        public int Create(Channel entity)
        {
            context.Channels.Add(entity);
            context.SaveChanges();
            return entity.IDChannel;
        }

        public List<Channel> ViewChannelID()
        {
            return context.Channels.ToList();
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
    }
}