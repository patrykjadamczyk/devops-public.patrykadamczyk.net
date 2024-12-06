using System;

using UIKit;
using Foundation;

namespace $NAMESPACE$
{
	  [Register("$CLASS$")]
    public partial class $CLASS$ : UIViewController
    {
        public $CLASS$() : base()
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
