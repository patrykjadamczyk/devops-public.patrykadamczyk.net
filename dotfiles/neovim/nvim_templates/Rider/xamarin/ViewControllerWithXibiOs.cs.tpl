;; cs
using System;

using UIKit;
using Foundation;

namespace {{_NAMESPACE_}}
{
    [Register("{{_CLASS_}}")]
    public partial class {{_CLASS_}} : UIViewController
    {
        public {{_CLASS_}}() : base("{{_CLASS_}}", null)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();
            // Perform any additional setup after loading the view, typically from a nib.
        }

        public override void DidReceiveMemoryWarning()
        {
            base.DidReceiveMemoryWarning();
            // Release any cached data, images, etc that aren't in use.
        }
    }
}
