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
    public class NewsController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: News
        public ActionResult Index()
        {
            var news = db.News.Where(w => w.Status == true).OrderByDescending(o => o.PostDate).Include(n => n.Employee);
            ViewBag.Image = db.ImageOfNews.ToList();
            return View(news.ToList());
        }
        public ActionResult IndexAdmin()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var news = db.News.Include(n => n.Employee);
            return View(news.ToList());
        }

        // GET: News/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return RedirectToAction("Index");
            }
            ViewBag.link = db.News.OrderByDescending(o => o.NewsID).ToList();
            ViewBag.Image = db.ImageOfNews.ToList();
            ViewBag.feedback = db.FeedbackToNews.Where(w => w.NewsID == id && w.Status == true).OrderByDescending(o => o.Date).ToList();
            return View(news);
        }
        public ActionResult DetailsAdmin(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }
        // GET: News/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName");
            return View();
        }

        // POST: News/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "NewsID,Title,Description,EmployeeID,Status,PostDate")] News news)
        {
            if (ModelState.IsValid)
            {
                db.News.Add(news);
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", news.EmployeeID);
            return View(news);
        }

        // GET: News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", news.EmployeeID);
            return View(news);
        }

        // POST: News/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "NewsID,Title,Description,EmployeeID,Status,PostDate")] News news)
        {
            if (ModelState.IsValid)
            {
                db.Entry(news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", news.EmployeeID);
            return View(news);
        }

        // GET: News/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: News/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.News.Find(id);
            db.News.Remove(news);
            db.SaveChanges();
            return RedirectToAction("IndexAdmin");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        // add feedback for News
        [HttpPost]
        public ActionResult AddFeedback(FeedbackToNew obj)
        {
            db.FeedbackToNews.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = obj.NewsID });
        }
    }
}
