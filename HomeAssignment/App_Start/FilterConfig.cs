using System.Diagnostics;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace HomeAssignment
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new ValidateUserInSessionFilter());
        }
    }

    public class ValidateUserInSessionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.ActionDescriptor.IsDefined(typeof(AllowAnonymousAttribute), true))
            {
                return;
            }

            var username = filterContext.RequestContext.HttpContext.Session["Cust_username"];
            if (username == null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new RouteValueDictionary(new
                    {
                        controller = "Home",
                        action = "Login"
                    })
                );
            }
        }
    }
}
