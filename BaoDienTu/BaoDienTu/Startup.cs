using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BaoDienTu.Startup))]
namespace BaoDienTu
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
