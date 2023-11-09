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
    public class FeedbackToPhenomenasController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: FeedbackToPhenomenas
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var feedbackToPhenomenas = db.FeedbackToPhenomenas.Include(f => f.Phenomena);
            return View(feedbackToPhenomenas.ToList());
        }

        // GET: FeedbackToPhenomenas/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToPhenomena feedbackToPhenomena = db.FeedbackToPhenomenas.Find(id);
            if (feedbackToPhenomena == null)
            {
                return HttpNotFound();
            }
            return View(feedbackToPhenomena);
        }

        // GET: FeedbackToPhenomenas/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.PhenomenaID = new SelectList(db.Phenomenas, "PhenomenaID", "PhenomenaName");
            return View();
        }

        // POST: FeedbackToPhenomenas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Email,Description,Date,Status,PhenomenaID")] FeedbackToPhenomena feedbackToPhenomena)
        {
            if (ModelState.IsValid)
            {
                db.FeedbackToPhenomenas.Add(feedbackToPhenomena);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PhenomenaID = new SelectList(db.Phenomenas, "PhenomenaID", "PhenomenaName", feedbackToPhenomena.PhenomenaID);
            return View(feedbackToPhenomena);
        }

        // GET: FeedbackToPhenomenas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToPhenomena feedbackToPhenomena = db.FeedbackToPhenomenas.Find(id);
            if (feedbackToPhenomena == null)
            {
                return HttpNotFound();
            }
            ViewBag.PhenomenaID = new SelectList(db.Phenomenas, "PhenomenaID", "PhenomenaName", feedbackToPhenomena.PhenomenaID);
            return View(feedbackToPhenomena);
        }

        // POST: FeedbackToPhenomenas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Email,Description,Date,Status,PhenomenaID")] FeedbackToPhenomena feedbackToPhenomena)
        {
            if (ModelState.IsValid)
            {
                db.Entry(feedbackToPhenomena).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PhenomenaID = new SelectList(db.Phenomenas, "PhenomenaID", "PhenomenaName", feedbackToPhenomena.PhenomenaID);
            return View(feedbackToPhenomena);
        }

        // GET: FeedbackToPhenomenas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToPhenomena feedbackToPhenomena = db.FeedbackToPhenomenas.Find(id);
            if (feedbackToPhenomena == null)
            {
                return HttpNotFound();
            }
            return View(feedbackToPhenomena);
        }

        // POST: FeedbackToPhenomenas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FeedbackToPhenomena feedbackToPhenomena = db.FeedbackToPhenomenas.Find(id);
            db.FeedbackToPhenomenas.Remove(feedbackToPhenomena);
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
