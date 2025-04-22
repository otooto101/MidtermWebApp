using Microsoft.AspNetCore.Mvc;

namespace MidtermWebApp.Controllers
{
    public class FeedbackController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(string name, string message)
        {
            ViewBag.Name = name;
            ViewBag.Message = message;
            return View("Confirmation");
        }
    }
}
