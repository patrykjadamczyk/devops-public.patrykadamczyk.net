;; cs
{{_HEADER_}}
namespace {{_NAMESPACE_}} {
    public class {{_CLASS_}} : UnityEditor.EditorWindow
    {
        [UnityEditor.MenuItem("{{_MENUITEM_}}/{{_MENUITEMCOMMAND_}}")]
        private static void ShowWindow()
        {
            var window = GetWindow<{{_CLASS_}}>();
            window.titleContent = new UnityEngine.GUIContent("{{_TITLE_}}");
            window.Show();
        }

        private void OnGUI()
        {
        }
    }
}
