using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Astronomy.Models;

namespace Astronomy.Controllers
{
    public class PlanetsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();
        public ActionResult IndexAdmin()
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "Users");
            }
            var planets = db.Planets.Include(p => p.Employee1);
            return View(planets.ToList());
        }
        // GET: Planets
        public ActionResult Index()
        {
            var planets = db.Planets.Where(w => w.Status == true).OrderByDescending(o => o.PlanetID).Include(p => p.Employee1);
            ViewBag.Images = db.ImageOfPlanet.ToList();
            return View(planets.ToList());
        }
        

        // GET: Planets/Details/5
        public ActionResult Details(int? id)
        {

            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Planet planet = db.Planets.Find(id);
            if (planet == null)
            {
                return RedirectToAction("Index");
            }
            ViewBag.Image = db.ImageOfPlanet.ToList();
            ViewBag.feedback = db.FeedbacktoPlanets.Where(f=>f.PlanetID == planet.PlanetID && f.Status == true).OrderByDescending(o=>o.Date).ToList();
            ViewBag.link = db.Planets.OrderByDescending(o=>o.PlanetID).ToList();
            return View(planet);
        }
        public ActionResult DetailsAdmin(int? id)
        {
            if (Session["Username"] == null)
            {
                return RedirectToAction("Login", "Users");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Planet planet = db.Planets.Find(id);
            if (planet == null)
            {
                return HttpNotFound();
            }
            return View(planet);
        }

        // GET: Planets/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) RedirectToAction("Login", "Users");
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PlanetID,PlanetName,RecordedBy,FirstRecord,SurfaceTemperature,OrbitPeriod,OrbitDistance,Rings,NotableMoons,KnownMoons,EquatorialCircumference,PolarDiameter,EquatorialDiameter,Mass,atmosphere,Description,Status,EmployeeID")] Planet planet)
        {
            if (ModelState.IsValid)
            {
                db.Planets.Add(planet);
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", planet.EmployeeID);
            return View(planet);
        }

        // GET: Planets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Planet planet = db.Planets.Find(id);
            if (planet == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", planet.EmployeeID);
            return View(planet);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PlanetID,PlanetName,RecordedBy,FirstRecord,SurfaceTemperature,OrbitPeriod,OrbitDistance,Rings,NotableMoons,KnownMoons,EquatorialCircumference,PolarDiameter,EquatorialDiameter,Mass,atmosphere,Description,Status,EmployeeID")] Planet planet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(planet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", planet.EmployeeID);
            return View(planet);
        }
        
        // add feedback for planets
        [HttpPost]
        public ActionResult AddFeedback(FeedbacktoPlanet obj)
        {
            db.FeedbacktoPlanets.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = obj.PlanetID });
        }


        // GET: Planets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Planet planet = db.Planets.Find(id);
            if (planet == null)
            {
                return HttpNotFound();
            }
            return View(planet);
        }

        // POST: Planets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Planet planet = db.Planets.Find(id);
            db.Planets.Remove(planet);
            db.SaveChanges();
            return RedirectToAction("IndexAdmin");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
