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
    public class FeedbacktoPlanetsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: FeedbacktoPlanets
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var feedbacktoPlanets = db.FeedbacktoPlanets.Include(f => f.Planet);
            return View(feedbacktoPlanets.ToList());
        }

        // GET: FeedbacktoPlanets/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoPlanet feedbacktoPlanet = db.FeedbacktoPlanets.Find(id);
            if (feedbacktoPlanet == null)
            {
                return HttpNotFound();
            }
            return View(feedbacktoPlanet);
        }

        // GET: FeedbacktoPlanets/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.PlanetID = new SelectList(db.Planets, "PlanetID", "PlanetName");
            return View();
        }

        // POST: FeedbacktoPlanets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Email,Description,Date,PlanetID,Status")] FeedbacktoPlanet feedbacktoPlanet)
        {
            if (ModelState.IsValid)
            {
                db.FeedbacktoPlanets.Add(feedbacktoPlanet);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PlanetID = new SelectList(db.Planets, "PlanetID", "PlanetName", feedbacktoPlanet.PlanetID);
            return View(feedbacktoPlanet);
        }

        // GET: FeedbacktoPlanets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoPlanet feedbacktoPlanet = db.FeedbacktoPlanets.Find(id);
            if (feedbacktoPlanet == null)
            {
                return HttpNotFound();
            }
            ViewBag.PlanetID = new SelectList(db.Planets, "PlanetID", "PlanetName", feedbacktoPlanet.PlanetID);
            return View(feedbacktoPlanet);
        }

        // POST: FeedbacktoPlanets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Email,Description,Date,PlanetID,Status")] FeedbacktoPlanet feedbacktoPlanet)
        {
            if (ModelState.IsValid)
            {
                db.Entry(feedbacktoPlanet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PlanetID = new SelectList(db.Planets, "PlanetID", "PlanetName", feedbacktoPlanet.PlanetID);
            return View(feedbacktoPlanet);
        }

        // GET: FeedbacktoPlanets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FeedbacktoPlanet feedbacktoPlanet = db.FeedbacktoPlanets.Find(id);
            if (feedbacktoPlanet == null)
            {
                return HttpNotFound();
            }
            return View(feedbacktoPlanet);
        }

        // POST: FeedbacktoPlanets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FeedbacktoPlanet feedbacktoPlanet = db.FeedbacktoPlanets.Find(id);
            db.FeedbacktoPlanets.Remove(feedbacktoPlanet);
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
