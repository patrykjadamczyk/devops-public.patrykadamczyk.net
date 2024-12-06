;; cs
using System;

using AppKit;
using Foundation;

namespace {{_NAMESPACE_}}
{
    [Register("{{_CLASS_}}")]
    public partial class {{_CLASS_}} : NSViewController
    {
        public {{_CLASS_}}() : base("{{_CLASS_}}", null)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            // Do any additional setup after loading the view.
        }
    }
}
