using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Astronomy.Models;

namespace Astronomy.Controllers
{
    public class PhenomenaController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        // GET: Phenomena
        public ActionResult Index()
        {
            var phenomenas = db.Phenomenas.Where(w => w.status == true).OrderByDescending(o => o.PostDate).Include(p => p.Employee);
            ViewBag.Images = db.ImageOfPhenomenas.ToList();
            return View(phenomenas.ToList());
        }
        public ActionResult IndexAdmin()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            var phenomenas = db.Phenomenas.Include(p => p.Employee);
            return View(phenomenas.ToList());
        }

        // GET: Phenomena/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                 return RedirectToAction("Index");
            }
            Phenomena phenomena = db.Phenomenas.Find(id);
            if (phenomena == null)
            {
                return RedirectToAction("Index");
            }
            ViewBag.feedback = db.FeedbackToPhenomenas.Where(x => x.PhenomenaID == phenomena.PhenomenaID && x.Status == true ).OrderByDescending(o => o.Date).ToList();
            ViewBag.Image = db.ImageOfPhenomenas.ToList();
            ViewBag.link = db.Phenomenas.OrderByDescending(o => o.PhenomenaID).ToList();
            return View(phenomena);
        }
        public ActionResult DetailsAdmin(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phenomena phenomena = db.Phenomenas.Find(id);
            if (phenomena == null)
            {
                return HttpNotFound();
            }
            return View(phenomena);
        }

        // GET: Phenomena/Create
        public ActionResult Create()
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName");
            return View();
        }

        // POST: Phenomena/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PhenomenaID,PhenomenaName,Title,status,Description,PostDate,EmployeeID")] Phenomena phenomena)
        {
            if (ModelState.IsValid)
            {
                db.Phenomenas.Add(phenomena);
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }

            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", phenomena.EmployeeID);
            return View(phenomena);
        }

        // GET: Phenomena/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phenomena phenomena = db.Phenomenas.Find(id);
            if (phenomena == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", phenomena.EmployeeID);
            return View(phenomena);
        }

        // POST: Phenomena/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PhenomenaID,PhenomenaName,Title,status,Description,PostDate,EmployeeID")] Phenomena phenomena)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phenomena).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexAdmin");
            }
            ViewBag.EmployeeID = new SelectList(db.Employees, "EmployeeID", "FirstName", phenomena.EmployeeID);
            return View(phenomena);
        }

        // GET: Phenomena/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["Username"] == null) return RedirectToAction("Login", "Users");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phenomena phenomena = db.Phenomenas.Find(id);
            if (phenomena == null)
            {
                return HttpNotFound();
            }
            return View(phenomena);
        }

        // POST: Phenomena/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Phenomena phenomena = db.Phenomenas.Find(id);
            db.Phenomenas.Remove(phenomena);
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
        // add feedback for planets
        [HttpPost]
        public ActionResult AddFeedback(FeedbackToPhenomena obj)
        {
            db.FeedbackToPhenomenas.Add(obj);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = obj.PhenomenaID });
        }
    }
}
