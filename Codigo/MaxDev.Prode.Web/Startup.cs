using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MaxDev.Prode.Web.Startup))]
namespace MaxDev.Prode.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
