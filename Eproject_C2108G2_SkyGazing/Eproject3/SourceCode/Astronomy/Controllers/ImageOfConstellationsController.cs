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
    public class ImageOfConstellationsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: ImageOfConstellations
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var imageOfConstellations = db.ImageOfConstellations.Include(i => i.Constellation);
            return View(imageOfConstellations.ToList());
        }

        // GET: ImageOfConstellations/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfConstellation imageOfConstellation = db.ImageOfConstellations.Find(id);
            if (imageOfConstellation == null)
            {
                return HttpNotFound();
            }
            return View(imageOfConstellation);
        }

        // GET: ImageOfConstellations/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.ConstellationID = new SelectList(db.Constellations, "ConstellationID", "ConstellationName");
            return View();
        }

        // POST: ImageOfConstellations/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ImageOfConstellation obj)
        {
            string filename = Path.GetFileNameWithoutExtension(obj.imageFile.FileName);
            string extension = Path.GetExtension(obj.imageFile.FileName);
            filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
            obj.Image = "~/Image/" + filename;
            filename = Path.Combine(Server.MapPath("~/Image/"), filename);
            obj.imageFile.SaveAs(filename);
            db.ImageOfConstellations.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Index");


            ViewBag.ConstellationID = new SelectList(db.Constellations, "ConstellationID", "ConstellationName", obj.ConstellationID);
            return View(obj);
        }

        // GET: ImageOfConstellations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfConstellation imageOfConstellation = db.ImageOfConstellations.Find(id);
            if (imageOfConstellation == null)
            {
                return HttpNotFound();
            }
            ViewBag.ConstellationID = new SelectList(db.Constellations, "ConstellationID", "ConstellationName", imageOfConstellation.ConstellationID);
            return View(imageOfConstellation);
        }

        // POST: ImageOfConstellations/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ImageOfConstellation imageOfConstellation)
        {
            if (ModelState.IsValid)
            {
                string filename = Path.GetFileNameWithoutExtension(imageOfConstellation.imageFile.FileName);
                string extension = Path.GetExtension(imageOfConstellation.imageFile.FileName);
                filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
                imageOfConstellation.Image = "~/Image/" + filename;
                filename = Path.Combine(Server.MapPath("~/Image/"), filename);
                db.Entry(imageOfConstellation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ConstellationID = new SelectList(db.Constellations, "ConstellationID", "ConstellationName", imageOfConstellation.ConstellationID);
            return View(imageOfConstellation);
        }

        // GET: ImageOfConstellations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfConstellation imageOfConstellation = db.ImageOfConstellations.Find(id);
            if (imageOfConstellation == null)
            {
                return HttpNotFound();
            }
            return View(imageOfConstellation);
        }

        // POST: ImageOfConstellations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {

            ImageOfConstellation imageOfConstellation = db.ImageOfConstellations.Find(id);
            string imgPath = Server.MapPath(imageOfConstellation.Image);
            db.ImageOfConstellations.Remove(imageOfConstellation);
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
