$HEADER$
using System.ComponentModel;

namespace $NAMESPACE$
{
    public partial class $CLASS$ : Component
    {
        public $CLASS$()
        {
            InitializeComponent();
        }

        public $CLASS$(IContainer container)
        {
            container.Add(this);

            InitializeComponent();
        }
    }
}
