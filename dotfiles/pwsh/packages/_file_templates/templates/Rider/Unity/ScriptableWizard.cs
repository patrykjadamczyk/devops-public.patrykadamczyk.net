$HEADER$
namespace $NAMESPACE$ {
    public class $CLASS$ : UnityEditor.ScriptableWizard
    {
        [UnityEditor.MenuItem("$MENUITEM$/$MENUITEMCOMMAND$")]
        public static void CreateWizard()
        {
            DisplayWizard<$CLASS$>("$TITLE$", "$CREATE$", "$OTHER$");
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
