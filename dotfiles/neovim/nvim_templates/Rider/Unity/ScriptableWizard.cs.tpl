;; cs
{{_HEADER_}}
namespace {{_NAMESPACE_}} {
    public class {{_CLASS_}} : UnityEditor.ScriptableWizard
    {
        [UnityEditor.MenuItem("{{_MENUITEM_}}/{{_MENUITEMCOMMAND_}}")]
        public static void CreateWizard()
        {
            DisplayWizard<{{_CLASS_}}>("{{_TITLE_}}", "{{_CREATE_}}", "{{_OTHER_}}");
        }

        public void OnWizardCreate()
        {
        }

        public void OnWizardUpdate()
        {
        }

        public void OnWizardOtherButton()
        {
        }
    }
}
