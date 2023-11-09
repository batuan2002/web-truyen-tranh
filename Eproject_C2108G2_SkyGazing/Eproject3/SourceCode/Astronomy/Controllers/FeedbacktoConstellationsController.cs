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
    public class FeedbacktoConstellationsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: FeedbacktoConstellations
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var feedbacktoConstellations = db.FeedbacktoConstellations.Include(f => f.Constellation);
            return View(feedbacktoConstellations.ToList());
        }

        // GET: FeedbacktoConstellations/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoConstellation feedbacktoConstellation = db.FeedbacktoConstellations.Find(id);
            if (feedbacktoConstellation == null)
            {
                return HttpNotFound();
            }
            return View(feedbacktoConstellation);
        }

        // GET: FeedbacktoConstellations/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.ConstellationID = new SelectList(db.Constellations, "ConstellationID", "ConstellationName");
            return View();
        }

        // POST: FeedbacktoConstellations/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Email,Description,Date,ConstellationID,Status")] FeedbacktoConstellation feedbacktoConstellation)
        {
            if (ModelState.IsValid)
            {
                db.FeedbacktoConstellations.Add(feedbacktoConstellation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ConstellationID = new SelectList(db.Constellations, "ConstellationID", "ConstellationName", feedbacktoConstellation.ConstellationID);
            return View(feedbacktoConstellation);
        }

        // GET: FeedbacktoConstellations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoConstellation feedbacktoConstellation = db.FeedbacktoConstellations.Find(id);
            if (feedbacktoConstellation == null)
            {
                return HttpNotFound();
            }
            ViewBag.ConstellationID = new SelectList(db.Constellations, "ConstellationID", "ConstellationName", feedbacktoConstellation.ConstellationID);
            return View(feedbacktoConstellation);
        }

        // POST: FeedbacktoConstellations/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Email,Description,Date,ConstellationID,Status")] FeedbacktoConstellation feedbacktoConstellation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(feedbacktoConstellation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ConstellationID = new SelectList(db.Constellations, "ConstellationID", "ConstellationName", feedbacktoConstellation.ConstellationID);
            return View(feedbacktoConstellation);
        }

        // GET: FeedbacktoConstellations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoConstellation feedbacktoConstellation = db.FeedbacktoConstellations.Find(id);
            if (feedbacktoConstellation == null)
            {
                return HttpNotFound();
            }
            return View(feedbacktoConstellation);
        }

        // POST: FeedbacktoConstellations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FeedbacktoConstellation feedbacktoConstellation = db.FeedbacktoConstellations.Find(id);
            db.FeedbacktoConstellations.Remove(feedbacktoConstellation);
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
