using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HomeAssignment.Startup))]
namespace HomeAssignment
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
