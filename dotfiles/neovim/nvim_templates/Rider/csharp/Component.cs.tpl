;; cs
{{_HEADER_}}
using System.ComponentModel;

namespace {{_NAMESPACE_}}
{
    public partial class {{_CLASS_}} : Component
    {
        public {{_CLASS_}}()
        {
            InitializeComponent();
        }

        public {{_CLASS_}}(IContainer container)
        {
            container.Add(this);

            InitializeComponent();
        }
    }
}
