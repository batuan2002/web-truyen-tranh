using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Astronomy.Models;

namespace Astronomy.Controllers
{
    public class FeedbacktoObservatoriesController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: FeedbacktoObservatories
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var feedbacktoObservatories = db.FeedbacktoObservatories.Include(f => f.Observatory);
            return View(feedbacktoObservatories.ToList());
        }

        // GET: FeedbacktoObservatories/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoObservatory feedbacktoObservatory = db.FeedbacktoObservatories.Find(id);
            if (feedbacktoObservatory == null)
            {
                return HttpNotFound();
            }
            return View(feedbacktoObservatory);
        }

        // GET: FeedbacktoObservatories/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.ObservatoryID = new SelectList(db.Observatories, "ObservatoryID", "ObservatoryName");
            return View();
        }

        // POST: FeedbacktoObservatories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Email,Description,ObservatoryID,Date,Status")] FeedbacktoObservatory feedbacktoObservatory)
        {
            if (ModelState.IsValid)
            {
                db.FeedbacktoObservatories.Add(feedbacktoObservatory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ObservatoryID = new SelectList(db.Observatories, "ObservatoryID", "ObservatoryName", feedbacktoObservatory.ObservatoryID);
            return View(feedbacktoObservatory);
        }

        // GET: FeedbacktoObservatories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoObservatory feedbacktoObservatory = db.FeedbacktoObservatories.Find(id);
            if (feedbacktoObservatory == null)
            {
                return HttpNotFound();
            }
            ViewBag.ObservatoryID = new SelectList(db.Observatories, "ObservatoryID", "ObservatoryName", feedbacktoObservatory.ObservatoryID);
            return View(feedbacktoObservatory);
        }

        // POST: FeedbacktoObservatories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Email,Description,ObservatoryID,Date,Status")] FeedbacktoObservatory feedbacktoObservatory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(feedbacktoObservatory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ObservatoryID = new SelectList(db.Observatories, "ObservatoryID", "ObservatoryName", feedbacktoObservatory.ObservatoryID);
            return View(feedbacktoObservatory);
        }

        // GET: FeedbacktoObservatories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoObservatory feedbacktoObservatory = db.FeedbacktoObservatories.Find(id);
            if (feedbacktoObservatory == null)
            {
                return HttpNotFound();
            }
            return View(feedbacktoObservatory);
        }

        // POST: FeedbacktoObservatories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FeedbacktoObservatory feedbacktoObservatory = db.FeedbacktoObservatories.Find(id);
            db.FeedbacktoObservatories.Remove(feedbacktoObservatory);
            db.SaveChanges();
            return RedirectToAction("Index");
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
