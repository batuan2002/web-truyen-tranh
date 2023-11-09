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
    public class CometsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: Comets
        public ActionResult Index()
        {
            var comets = db.Comets.Where(w=>w.Status == true).OrderByDescending(o=>o.CometID);
            ViewBag.Images = db.ImageOfComets.ToList();
            return View(comets.ToList());
        }
        public ActionResult IndexAdmin()
        {
            //check login
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var comets = db.Comets.Include(c => c.Employee);
            return View(comets.ToList());
        }
        // GET: Comets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Comet comet = db.Comets.Find(id);
            if (comet == null)
            {
                return RedirectToAction("Index");
            }
            ViewBag.link = db.Comets.OrderByDescending(o => o.CometID).ToList();
            ViewBag.feedback = db.FeedbackToComets.Where(x => x.CometID == comet.CometID && x.bit == true).OrderByDescending(o => o.Date).ToList();
            ViewBag.Image = db.ImageOfComets.ToList();
            return View(comet);
        }
        public ActionResult DetailsAdmin(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comet comet = db.Comets.Find(id);
            if (comet == null)
            {
                return HttpNotFound();
            }
            return View(comet);
        }

        // GET: Comets/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName");
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CometID,CometName,EarthMOID,Dimensions,Meandiameter,Mass,Aphelion,Perihelion,DiscoveredBy,DiscoveredDate,EmployeeID,Description,Status")] Comet comet)
        {
            if (ModelState.IsValid)
            {
                db.Comets.Add(comet);
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", comet.EmployeeID);
            return View(comet);
        }
        // add feedback for Comets
        [HttpPost]
        public ActionResult AddFeedback(FeedbackToComet obj)
        {
            db.FeedbackToComets.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = obj.CometID });
        }
        // GET: Comets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comet comet = db.Comets.Find(id);
            if (comet == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", comet.EmployeeID);
            return View(comet);
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CometID,CometName,EarthMOID,Dimensions,Meandiameter,Mass,Aphelion,Perihelion,DiscoveredBy,DiscoveredDate,EmployeeID,Description,Status")] Comet comet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", comet.EmployeeID);
            return View(comet);
        }

        // GET: Comets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comet comet = db.Comets.Find(id);
            if (comet == null)
            {
                return HttpNotFound();
            }
            return View(comet);
        }

        // POST: Comets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Comet comet = db.Comets.Find(id);
            db.Comets.Remove(comet);
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
