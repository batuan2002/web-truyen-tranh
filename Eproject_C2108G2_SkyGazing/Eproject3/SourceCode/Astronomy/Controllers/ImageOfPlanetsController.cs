using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Astronomy.Models;

namespace Astronomy.Controllers
{
    public class ImageOfPlanetsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: ImageOfPlanets
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var imageOfPlanets = db.ImageOfPlanet.Include(i => i.Planet);
            return View(imageOfPlanets.ToList());
        }

        // GET: ImageOfPlanets/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfPlanet imageOfPlanet = db.ImageOfPlanet.Find(id);
            if (imageOfPlanet == null)
            {
                return HttpNotFound();
            }
            return View(imageOfPlanet);
        }

        // GET: ImageOfPlanets/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.PlanetID = new SelectList(db.Planets, "PlanetID", "PlanetName");
            return View();
        }

        // POST: ImageOfPlanets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( ImageOfPlanet obj)
        {
                string filename = Path.GetFileNameWithoutExtension(obj.imageFile.FileName);
                string extension = Path.GetExtension(obj.imageFile.FileName);
                filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
                obj.Image = "~/Image/" + filename;
                filename = Path.Combine(Server.MapPath("~/Image/"), filename);
                obj.imageFile.SaveAs(filename);
                db.ImageOfPlanet.Add(obj);
                db.SaveChanges();
                return RedirectToAction("Index");
            

            ViewBag.PlanetID = new SelectList(db.Planets, "PlanetID", "PlanetName", obj.PlanetID);
            return View(obj);
        }

        // GET: ImageOfPlanets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfPlanet imageOfPlanet = db.ImageOfPlanet.Find(id);
            if (imageOfPlanet == null)
            {
                return HttpNotFound();
            }
            ViewBag.PlanetID = new SelectList(db.Planets, "PlanetID", "PlanetName", imageOfPlanet.PlanetID);
            return View(imageOfPlanet);
        }

        // POST: ImageOfPlanets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( ImageOfPlanet obj)
        {
            if (ModelState.IsValid)
            {
                string filename = Path.GetFileNameWithoutExtension(obj.imageFile.FileName);
                string extension = Path.GetExtension(obj.imageFile.FileName);
                filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
                obj.Image = "~/Image/" + filename;
                filename = Path.Combine(Server.MapPath("~/Image/"), filename);
                obj.imageFile.SaveAs(filename);
                db.Entry(obj).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PlanetID = new SelectList(db.Planets, "PlanetID", "PlanetName", obj.PlanetID);
            return View(obj);
        }

        // GET: ImageOfPlanets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfPlanet imageOfPlanet = db.ImageOfPlanet.Find(id);
            if (imageOfPlanet == null)
            {
                return HttpNotFound();
            }
            return View(imageOfPlanet);
        }

        // POST: ImageOfPlanets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ImageOfPlanet imageOfPlanet = db.ImageOfPlanet.Find(id);
            string imgPath = Server.MapPath(imageOfPlanet.Image);
            db.ImageOfPlanet.Remove(imageOfPlanet);
            db.SaveChanges();
            if (System.IO.File.Exists(imgPath))
            {
                System.IO.File.Delete(imgPath);
            }
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
