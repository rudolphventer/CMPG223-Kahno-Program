using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Kahno.Startup))]
namespace Kahno
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
