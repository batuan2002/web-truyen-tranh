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
    public class ConstellationsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: Constellations
        public ActionResult Index()
        {
            var constellations = db.Constellations.Where(w => w.Status == true).OrderByDescending(o => o.ConstellationID).Include(c => c.Employee);
            ViewBag.Images = db.ImageOfConstellations.ToList();
            return View(constellations.ToList());
        }
        public ActionResult IndexAdmin()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var constellations = db.Constellations.Include(c => c.Employee);
            return View(constellations.ToList());
        }

        // GET: Constellations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Constellation constellation = db.Constellations.Find(id);
            if (constellation == null)
            {
                return RedirectToAction("Index");
            }
            //get link
            ViewBag.link = db.Constellations.OrderByDescending(o => o.ConstellationID).ToList();
            //get feedback of article
            ViewBag.feedback = db.FeedbacktoConstellations.Where(x => x.ConstellationID == constellation.ConstellationID && x.Status == true).OrderByDescending(o => o.Date).ToList();
            //get image to post
            ViewBag.Image = db.ImageOfConstellations.ToList();
            return View(constellation);
        }
        public ActionResult DetailsAdmin(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Constellation constellation = db.Constellations.Find(id);
            if (constellation == null)
            {
                return HttpNotFound();
            }
            return View(constellation);
        }

        // GET: Constellations/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName");
            return View();
        }

        // POST: Constellations/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ConstellationID,ConstellationName,Abbreviation,Genitive,Symbolism,Declination,Area,MainStar,Meteor,Description,EmployeeID,Status")] Constellation constellation)
        {
            if (ModelState.IsValid)
            {
                db.Constellations.Add(constellation);
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", constellation.EmployeeID);
            return View(constellation);
        }

        // GET: Constellations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Constellation constellation = db.Constellations.Find(id);
            if (constellation == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", constellation.EmployeeID);
            return View(constellation);
        }

        // POST: Constellations/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ConstellationID,ConstellationName,Abbreviation,Genitive,Symbolism,Declination,Area,MainStar,Meteor,Description,EmployeeID,Status")] Constellation constellation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(constellation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", constellation.EmployeeID);
            return View(constellation);
        }

        // GET: Constellations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Constellation constellation = db.Constellations.Find(id);
            if (constellation == null)
            {
                return HttpNotFound();
            }
            return View(constellation);
        }

        // POST: Constellations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Constellation constellation = db.Constellations.Find(id);
            db.Constellations.Remove(constellation);
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
        // add feedback for planets
        [HttpPost]
        public ActionResult AddFeedback(FeedbacktoConstellation obj)
        {
            db.FeedbacktoConstellations.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = obj.ConstellationID });
        }
    }
}
