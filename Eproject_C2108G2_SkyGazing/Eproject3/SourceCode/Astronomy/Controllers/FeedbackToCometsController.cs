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
    public class FeedbackToCometsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: FeedbackToComets
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var feedbackToComets = db.FeedbackToComets.Include(f => f.Comet);
            return View(feedbackToComets.ToList());
        }

        // GET: FeedbackToComets/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToComet feedbackToComet = db.FeedbackToComets.Find(id);
            if (feedbackToComet == null)
            {
                return HttpNotFound();
            }
            return View(feedbackToComet);
        }

        // GET: FeedbackToComets/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.CometID = new SelectList(db.Comets, "CometID", "CometName");
            return View();
        }

        // POST: FeedbackToComets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Email,Description,Date,bit,CometID")] FeedbackToComet feedbackToComet)
        {
            if (ModelState.IsValid)
            {
                db.FeedbackToComets.Add(feedbackToComet);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CometID = new SelectList(db.Comets, "CometID", "CometName", feedbackToComet.CometID);
            return View(feedbackToComet);
        }

        // GET: FeedbackToComets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToComet feedbackToComet = db.FeedbackToComets.Find(id);
            if (feedbackToComet == null)
            {
                return HttpNotFound();
            }
            ViewBag.CometID = new SelectList(db.Comets, "CometID", "CometName", feedbackToComet.CometID);
            return View(feedbackToComet);
        }

        // POST: FeedbackToComets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Email,Description,Date,bit,CometID")] FeedbackToComet feedbackToComet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(feedbackToComet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CometID = new SelectList(db.Comets, "CometID", "CometName", feedbackToComet.CometID);
            return View(feedbackToComet);
        }

        // GET: FeedbackToComets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToComet feedbackToComet = db.FeedbackToComets.Find(id);
            if (feedbackToComet == null)
            {
                return HttpNotFound();
            }
            return View(feedbackToComet);
        }

        // POST: FeedbackToComets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FeedbackToComet feedbackToComet = db.FeedbackToComets.Find(id);
            db.FeedbackToComets.Remove(feedbackToComet);
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
