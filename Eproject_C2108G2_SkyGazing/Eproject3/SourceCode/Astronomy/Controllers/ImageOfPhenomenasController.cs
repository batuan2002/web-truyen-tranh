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
    public class ImageOfPhenomenasController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: ImageOfPhenomenas
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var imageOfPhenomenas = db.ImageOfPhenomenas.Include(i => i.Phenomena);
            return View(imageOfPhenomenas.ToList());
        }

        // GET: ImageOfPhenomenas/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfPhenomena imageOfPhenomena = db.ImageOfPhenomenas.Find(id);
            if (imageOfPhenomena == null)
            {
                return HttpNotFound();
            }
            return View(imageOfPhenomena);
        }

        // GET: ImageOfPhenomenas/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.PhenomenaID = new SelectList(db.Phenomenas, "PhenomenaID", "PhenomenaName");
            return View();
        }

        // POST: ImageOfPhenomenas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ImageOfPhenomena obj)
        {
            string filename = Path.GetFileNameWithoutExtension(obj.imageFile.FileName);
            string extension = Path.GetExtension(obj.imageFile.FileName);
            filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
            obj.Image = "~/Image/" + filename;
            filename = Path.Combine(Server.MapPath("~/Image/"), filename);
            obj.imageFile.SaveAs(filename);
            db.ImageOfPhenomenas.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Index");


            ViewBag.PhenomenaID = new SelectList(db.Phenomenas, "PhenomenaID", "PhenomenaName", obj.PhenomenaID);
            return View(obj);
        }

        // GET: ImageOfPhenomenas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfPhenomena imageOfPhenomena = db.ImageOfPhenomenas.Find(id);
            if (imageOfPhenomena == null)
            {
                return HttpNotFound();
            }
            ViewBag.PhenomenaID = new SelectList(db.Phenomenas, "PhenomenaID", "PhenomenaName", imageOfPhenomena.PhenomenaID);
            return View(imageOfPhenomena);
        }

        // POST: ImageOfPhenomenas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ImageOfPhenomena imageOfPhenomena)
        {
            if (ModelState.IsValid)
            {
                string filename = Path.GetFileNameWithoutExtension(imageOfPhenomena.imageFile.FileName);
                string extension = Path.GetExtension(imageOfPhenomena.imageFile.FileName);
                filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
                imageOfPhenomena.Image = "~/Image/" + filename;
                filename = Path.Combine(Server.MapPath("~/Image/"), filename);
                db.Entry(imageOfPhenomena).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PhenomenaID = new SelectList(db.Phenomenas, "PhenomenaID", "PhenomenaName", imageOfPhenomena.PhenomenaID);
            return View(imageOfPhenomena);
        }

        // GET: ImageOfPhenomenas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfPhenomena imageOfPhenomena = db.ImageOfPhenomenas.Find(id);
            if (imageOfPhenomena == null)
            {
                return HttpNotFound();
            }
            return View(imageOfPhenomena);
        }

        // POST: ImageOfPhenomenas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ImageOfPhenomena imageOfPhenomena = db.ImageOfPhenomenas.Find(id);
            string imgPath = Server.MapPath(imageOfPhenomena.Image);
            db.ImageOfPhenomenas.Remove(imageOfPhenomena);
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
