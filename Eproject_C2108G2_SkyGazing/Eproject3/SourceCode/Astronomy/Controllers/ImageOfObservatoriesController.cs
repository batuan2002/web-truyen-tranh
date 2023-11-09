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
    public class ImageOfObservatoriesController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: ImageOfObservatories
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var imageOfObservatories = db.ImageOfObservatory.Include(i => i.Observatory);
            return View(imageOfObservatories.ToList());
        }

        // GET: ImageOfObservatories/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfObservatory imageOfObservatory = db.ImageOfObservatory.Find(id);
            if (imageOfObservatory == null)
            {
                return HttpNotFound();
            }
            return View(imageOfObservatory);
        }

        // GET: ImageOfObservatories/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.ObservatoryID = new SelectList(db.Observatories, "ObservatoryID", "ObservatoryName");
            return View();
        }

        // POST: ImageOfObservatory/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ImageOfObservatory obj)
        {
            string filename = Path.GetFileNameWithoutExtension(obj.imageFile.FileName);
            string extension = Path.GetExtension(obj.imageFile.FileName);
            filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
            obj.Image = "~/Image/" + filename;
            filename = Path.Combine(Server.MapPath("~/Image/"), filename);
            obj.imageFile.SaveAs(filename);
            db.ImageOfObservatory.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Index");


            ViewBag.ObservatoryID = new SelectList(db.Observatories, "ObservatoryID", "ObservatoryName", obj.ObservatoryID);
            return View(obj);
        }

        // GET: ImageOfObservatories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfObservatory imageOfObservatory = db.ImageOfObservatory.Find(id);
            if (imageOfObservatory == null)
            {
                return HttpNotFound();
            }
            ViewBag.ObservatoryID = new SelectList(db.Observatories, "ObservatoryID", "ObservatoryName", imageOfObservatory.ObservatoryID);
            return View(imageOfObservatory);
        }

        // POST: ImageOfObservatories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( ImageOfObservatory imageOfObservatory)
        {
            if (ModelState.IsValid)
            {
                string filename = Path.GetFileNameWithoutExtension(imageOfObservatory.imageFile.FileName);
                string extension = Path.GetExtension(imageOfObservatory.imageFile.FileName);
                filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
                imageOfObservatory.Image = "~/Image/" + filename;
                filename = Path.Combine(Server.MapPath("~/Image/"), filename);
                db.Entry(imageOfObservatory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ObservatoryID = new SelectList(db.Observatories, "ObservatoryID", "ObservatoryName", imageOfObservatory.ObservatoryID);
            return View(imageOfObservatory);
        }

        // GET: ImageOfObservatory/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfObservatory imageOfObservatory = db.ImageOfObservatory.Find(id);
            if (imageOfObservatory == null)
            {
                return HttpNotFound();
            }
            return View(imageOfObservatory);
        }

        // POST: ImageOfObservatories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ImageOfObservatory imageOfObservatory = db.ImageOfObservatory.Find(id);
            string imgPath = Server.MapPath(imageOfObservatory.Image);
            db.ImageOfObservatory.Remove(imageOfObservatory);
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
