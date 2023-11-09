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
    public class ImageOfCometsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: ImageOfComets
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var imageOfComets = db.ImageOfComets.Include(i => i.Comet);
            return View(imageOfComets.ToList());
        }
        
        // GET: ImageOfComets/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfComet imageOfComet = db.ImageOfComets.Find(id);
            if (imageOfComet == null)
            {
                return HttpNotFound();
            }
            return View(imageOfComet);
        }

        // GET: ImageOfComets/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.CometID = new SelectList(db.Comets, "CometID", "CometName");
            return View();
        }

        // POST: ImageOfComets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ImageOfComet obj)
        {
            // Insert Image 
            string filename = Path.GetFileNameWithoutExtension(obj.imageFile.FileName);
            string extension = Path.GetExtension(obj.imageFile.FileName);
            filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
            obj.Image = "~/Image/" + filename;
            filename = Path.Combine(Server.MapPath("~/Image/"), filename);
            obj.imageFile.SaveAs(filename);

            db.ImageOfComets.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Index");


            ViewBag.CometID = new SelectList(db.Planets, "CometID", "CometName", obj.CometID);
            return View(obj);
        }

        // GET: ImageOfComets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfComet imageOfComet = db.ImageOfComets.Find(id);
            if (imageOfComet == null)
            {
                return HttpNotFound();
            }
            ViewBag.CometID = new SelectList(db.Comets, "CometID", "CometName", imageOfComet.CometID);
            return View(imageOfComet);
        }

        // POST: ImageOfComets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( ImageOfComet imageOfComet)
        {
            if (ModelState.IsValid)
            {
                string filename = Path.GetFileNameWithoutExtension(imageOfComet.imageFile.FileName);
                string extension = Path.GetExtension(imageOfComet.imageFile.FileName);
                filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
                imageOfComet.Image = "~/Image/" + filename;
                filename = Path.Combine(Server.MapPath("~/Image/"), filename);
                db.Entry(imageOfComet).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CometID = new SelectList(db.Comets, "CometID", "CometName", imageOfComet.CometID);
            return View(imageOfComet);
        }

        // GET: ImageOfComets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfComet imageOfComet = db.ImageOfComets.Find(id);
            if (imageOfComet == null)
            {
                return HttpNotFound();
            }
            return View(imageOfComet);
        }

        // POST: ImageOfComets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ImageOfComet imageOfComet = db.ImageOfComets.Find(id);
            string imgPath = Server.MapPath(imageOfComet.Image); // get image nam to delete 
            db.ImageOfComets.Remove(imageOfComet);
            db.SaveChanges();
            //delete image
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
