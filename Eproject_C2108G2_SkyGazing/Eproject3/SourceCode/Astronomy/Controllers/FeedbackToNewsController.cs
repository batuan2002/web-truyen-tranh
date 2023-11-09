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
    public class FeedbackToNewsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: FeedbackToNews
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var feedbackToNews = db.FeedbackToNews.Include(f => f.News);
            return View(feedbackToNews.ToList());
        }

        // GET: FeedbackToNews/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToNew feedbackToNew = db.FeedbackToNews.Find(id);
            if (feedbackToNew == null)
            {
                return HttpNotFound();
            }
            return View(feedbackToNew);
        }

        // GET: FeedbackToNews/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.NewsID = new SelectList(db.News, "NewsID", "Title");
            return View();
        }

        // POST: FeedbackToNews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Email,Description,Date,Status,NewsID")] FeedbackToNew feedbackToNew)
        {
            if (ModelState.IsValid)
            {
                db.FeedbackToNews.Add(feedbackToNew);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.NewsID = new SelectList(db.News, "NewsID", "Title", feedbackToNew.NewsID);
            return View(feedbackToNew);
        }

        // GET: FeedbackToNews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToNew feedbackToNew = db.FeedbackToNews.Find(id);
            if (feedbackToNew == null)
            {
                return HttpNotFound();
            }
            ViewBag.NewsID = new SelectList(db.News, "NewsID", "Title", feedbackToNew.NewsID);
            return View(feedbackToNew);
        }

        // POST: FeedbackToNews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Email,Description,Date,Status,NewsID")] FeedbackToNew feedbackToNew)
        {
            if (ModelState.IsValid)
            {
                db.Entry(feedbackToNew).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.NewsID = new SelectList(db.News, "NewsID", "Title", feedbackToNew.NewsID);
            return View(feedbackToNew);
        }

        // GET: FeedbackToNews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbackToNew feedbackToNew = db.FeedbackToNews.Find(id);
            if (feedbackToNew == null)
            {
                return HttpNotFound();
            }
            return View(feedbackToNew);
        }

        // POST: FeedbackToNews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FeedbackToNew feedbackToNew = db.FeedbackToNews.Find(id);
            db.FeedbackToNews.Remove(feedbackToNew);
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
