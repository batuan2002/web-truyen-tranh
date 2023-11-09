using Astronomy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Astronomy.Controllers
{
    public class AdminController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();
        // GET: Admin
        //Home webadmin
        public ActionResult Index()
        {
            //check login
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            string stt = "Wellcome to WebAdmin, ";
            stt += Session["Username"];
            ViewBag.stt = stt;
            //get total all category
            ViewBag.countPlanets = db.Planets.ToList().Count;
            ViewBag.countConstellations = db.Constellations.ToList().Count;
            ViewBag.countPhenomenas = db.Phenomenas.ToList().Count;
            ViewBag.countNews = db.News.ToList().Count;
            ViewBag.countObservatories = db.Observatories.ToList().Count;
            ViewBag.countComets = db.Comets.ToList().Count;
            return View();
        }
    }
}