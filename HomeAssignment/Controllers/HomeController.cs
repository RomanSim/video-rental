using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HomeAssignment.Models;
using Microsoft.AspNet.Identity;

namespace HomeAssignment.Controllers
{
    public class HomeController : Controller
    {
      
        public ActionResult Index()
        {
            var username = new Customer() { Cust_username = ("Hello "+(string)Session["Cust_username"]) };
            return View(username);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }
        //login to the website
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult Login(Customer objUser)
        {
            if (ModelState.IsValid)
            {
                using (MoviesDatabaseEntities db = new MoviesDatabaseEntities())
                {
                    var obj = db.Customers.Where(a => a.Cust_username.Equals(objUser.Cust_username) && a.Cust_password.Equals(objUser.Cust_password)).FirstOrDefault();
                    if (obj != null)
                    {
                        Session["CustomerID"] = obj.CustomerID.ToString();
                        Session["Cust_username"] = obj.Cust_username.ToString();
                        return RedirectToAction("Index");
                    }
                }
            }
            return View(objUser);
        }

        public ActionResult HomePage()
        {
            if (Session["CustomerID"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        
    }
}  
    
