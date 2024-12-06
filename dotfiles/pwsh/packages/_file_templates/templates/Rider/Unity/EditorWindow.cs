$HEADER$
namespace $NAMESPACE$ {
    public class $CLASS$ : UnityEditor.EditorWindow
    {
        [UnityEditor.MenuItem("$MENUITEM$/$MENUITEMCOMMAND$")]
        private static void ShowWindow()
        {
            var window = GetWindow<$CLASS$>();
            window.titleContent = new UnityEngine.GUIContent("$TITLE$");
            window.Show();
        }

        private void OnGUI()
        {
        }
    }
}
