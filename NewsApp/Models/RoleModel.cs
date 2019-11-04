using Models.EF;

namespace Models
{
    public class RoleModel
    {
        NewsAppDbContext context = null;
        public RoleModel()
        {
            context = new NewsAppDbContext();
        }      
    }
}
