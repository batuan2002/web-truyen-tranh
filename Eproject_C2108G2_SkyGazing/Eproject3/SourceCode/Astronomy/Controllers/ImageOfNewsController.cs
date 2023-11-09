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
    public class ImageOfNewsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: ImageOfNews
        public ActionResult Index()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var imageOfNews = db.ImageOfNews.Include(i => i.News);
            return View(imageOfNews.ToList());
        }
        // GET: ImageOfNews/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfNew imageOfNew = db.ImageOfNews.Find(id);
            if (imageOfNew == null)
            {
                return HttpNotFound();
            }
            return View(imageOfNew);
        }

        // GET: ImageOfNews/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.NewsID = new SelectList(db.News, "NewsID", "Title");
            return View();
        }

        // POST: ImageOfNews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ImageOfNew obj)
        {
            string filename = Path.GetFileNameWithoutExtension(obj.imageFile.FileName);
            string extension = Path.GetExtension(obj.imageFile.FileName);
            filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
            obj.Image = "~/Image/" + filename;
            filename = Path.Combine(Server.MapPath("~/Image/"), filename);
            obj.imageFile.SaveAs(filename);
            db.ImageOfNews.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Index");


            ViewBag.NewsID = new SelectList(db.News, "NewsID", "Title", obj.NewsID);
            return View(obj);
        }

        // GET: ImageOfNews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfNew imageOfNew = db.ImageOfNews.Find(id);
            if (imageOfNew == null)
            {
                return HttpNotFound();
            }
            ViewBag.NewsID = new SelectList(db.News, "NewsID", "Title", imageOfNew.NewsID);
            return View(imageOfNew);
        }

        // POST: ImageOfNews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ImageOfNew imageOfNew)
        {
            if (ModelState.IsValid)
            {
                string filename = Path.GetFileNameWithoutExtension(imageOfNew.imageFile.FileName);
                string extension = Path.GetExtension(imageOfNew.imageFile.FileName);
                filename = filename + DateTime.Now.ToString("yymmssffff") + extension;
                imageOfNew.Image = "~/Image/" + filename;
                filename = Path.Combine(Server.MapPath("~/Image/"), filename);
                db.Entry(imageOfNew).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.NewsID = new SelectList(db.News, "NewsID", "Title", imageOfNew.NewsID);
            return View(imageOfNew);
        }

        // GET: ImageOfNews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ImageOfNew imageOfNew = db.ImageOfNews.Find(id);
            if (imageOfNew == null)
            {
                return HttpNotFound();
            }
            return View(imageOfNew);
        }

        // POST: ImageOfNews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ImageOfNew imageOfNew = db.ImageOfNews.Find(id);
            string imgPath = Server.MapPath(imageOfNew.Image);
            db.ImageOfNews.Remove(imageOfNew);
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
