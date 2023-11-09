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
    public class ObservatoriesController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: Observatories
        public ActionResult Index()
        {
            var observatories = db.Observatories.Where(w => w.Status == true).OrderByDescending(o => o.ObservatoryID).Include(o => o.Employee);
            ViewBag.Images = db.ImageOfObservatory.ToList();
            return View(observatories.ToList());
        }
        public ActionResult IndexAdmin()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var observatories = db.Observatories.Include(o => o.Employee);
            return View(observatories.ToList());
        }
        public ActionResult DetailsAdmin(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Observatory observatory = db.Observatories.Find(id);
            if (observatory == null)
            {
                return HttpNotFound();
            }
            return View(observatory);
        }
        // GET: Observatories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Observatory observatory = db.Observatories.Find(id);
            if (observatory == null)
            {
                return RedirectToAction("Index");
            }
            ViewBag.link = db.Observatories.OrderByDescending(o => o.ObservatoryID).ToList();
            ViewBag.feedback = db.FeedbacktoObservatories.Where(x => x.ObservatoryID == observatory.ObservatoryID && x.Status == true).OrderByDescending(o => o.Date).ToList();
            ViewBag.Image = db.ImageOfObservatory.ToList();
            return View(observatory);
        }

        // GET: Observatories/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName");
            return View();
        }

        // POST: Observatories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ObservatoryID,ObservatoryName,Elevation,ObservatorySite,Location,coordinates,Established,TypeOfObservatory,MajorInstruments,Status,EmployeeID")] Observatory observatory)
        {
            if (ModelState.IsValid)
            {
                db.Observatories.Add(observatory);
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", observatory.EmployeeID);
            return View(observatory);
        }

        // GET: Observatories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Observatory observatory = db.Observatories.Find(id);
            if (observatory == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", observatory.EmployeeID);
            return View(observatory);
        }

        // POST: Observatories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ObservatoryID,ObservatoryName,Elevation,ObservatorySite,Location,coordinates,Established,TypeOfObservatory,MajorInstruments,Status,EmployeeID")] Observatory observatory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(observatory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", observatory.EmployeeID);
            return View(observatory);
        }

        // GET: Observatories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Observatory observatory = db.Observatories.Find(id);
            if (observatory == null)
            {
                return HttpNotFound();
            }
            return View(observatory);
        }

        // POST: Observatories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Observatory observatory = db.Observatories.Find(id);
            db.Observatories.Remove(observatory);
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
        // add feedback
        public ActionResult AddFeedback(FeedbacktoObservatory obj)
        {
            db.FeedbacktoObservatories.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = obj.ObservatoryID });
        }
    }
}
