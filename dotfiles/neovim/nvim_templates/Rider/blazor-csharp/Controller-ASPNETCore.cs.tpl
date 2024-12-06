;; cs
{{_HEADER_}}
using Microsoft.AspNetCore.Mvc;

namespace {{_NAMESPACE_}}
{
    public class {{_CLASS_}}: Controller
    {
        // GET
        public IActionResult Index()
        {
            return View();
        }
    }
}
