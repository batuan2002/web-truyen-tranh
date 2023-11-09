using Astronomy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;

namespace Astronomy.Controllers
{
    public class HomeController : Controller
    {
        private AstronomyEntities db = new AstronomyEntities();

        //Home of project
        public ActionResult Index()
        {
            return View();
        }
        //list hot news of website
        public ActionResult Hot()
        {
            ViewBag.news = db.News.OrderByDescending(s => s.PostDate).ToList();
            ViewBag.imagenews = db.ImageOfNews.ToList();
            
            return View();
        }
        //seach 
        [HttpPost]
        public ActionResult Search(string search)
        {
            if(search == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<Planet> listplanet = db.Planets.Where(x=>x.PlanetName.Contains(search)).ToList();
            ViewBag.listplanet = listplanet;
            List<ImageOfPlanet> imagesPlanet = db.ImageOfPlanet.ToList();
            ViewBag.imagesplanet = imagesPlanet;

            List<Comet> listComet = db.Comets.Where(x => x.CometName.Contains(search)).ToList();
            ViewBag.listComet = listComet;
            List<ImageOfComet> imagesComet = db.ImageOfComets.ToList();
            ViewBag.imagesComet = imagesComet;

            List<Observatory> listObser = db.Observatories.Where(x => x.ObservatoryName.Contains(search)).ToList();
            ViewBag.listObser = listObser;
            List<ImageOfObservatory> imagesobser = db.ImageOfObservatory.ToList();
            ViewBag.imagesobser = imagesobser;

            List<Constellation> listConstellation = db.Constellations.Where(x => x.ConstellationName.Contains(search)).ToList();
            ViewBag.listConstellation = listConstellation;
            List<ImageOfConstellation> imagesCon = db.ImageOfConstellations.ToList();
            ViewBag.imagesCon = imagesCon;

            List<News> listnews = db.News.Where(x => x.Title.Contains(search)).ToList();
            ViewBag.listnews = listnews;
            List<ImageOfNew> imagesNews = db.ImageOfNews.ToList();
            ViewBag.imagesNews = imagesNews;

            List<Phenomena> listphenomane = db.Phenomenas.Where(x => x.PhenomenaName.Contains(search)).ToList();
            ViewBag.listphenomane = listphenomane;
            List<ImageOfPhenomena> imagesPheno = db.ImageOfPhenomenas.ToList();
            ViewBag.imagesPheno = imagesPheno;

            ViewBag.search = search;
            return View();
        }
        //whengazing view
        public ActionResult WhenGazing()
        {
            return View();
        }
        //where gazing view
        public ActionResult WhereGazing()
        {
            return View();
        }
        //whatseegazing veiw
        public ActionResult WhatSeeGazing()
        {
            return View();
        }
        //contact view
        public ActionResult Contact ()
        {
            return View();
        }
        //About us view 
        public ActionResult AboutUs()
        {
            return View();
        }
        //list image of website
        public ActionResult Images()
        {
            List<string> listimage = new List<string>();
            dynamic images = db.ImageOfComets.ToList();
            foreach(ImageOfComet item in images)
            {
                listimage.Add(item.Image);
            }
            images = db.ImageOfConstellations.ToList();
            foreach (ImageOfConstellation item in images)
            {
                listimage.Add(item.Image);
            }
            images = db.ImageOfNews.ToList();
            foreach (ImageOfNew item in images)
            {
                listimage.Add(item.Image);
            }
            images = db.ImageOfObservatory.ToList();
            foreach (ImageOfObservatory item in images)
            {
                listimage.Add(item.Image);
            }
            images = db.ImageOfPhenomenas.ToList();
            foreach (ImageOfPhenomena item in images)
            {
                listimage.Add(item.Image);
            }
            images = db.ImageOfPlanet.ToList();
            foreach (ImageOfPlanet item in images)
            {
                listimage.Add(item.Image);
            }
            ViewBag.listimage = listimage;
            return View();
        }
        
    }
}