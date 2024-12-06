$HEADER$
namespace $NAMESPACE$ {
    [UnityEditor.CustomPropertyDrawer(typeof($TYPE$))]
    public class $CLASS$ : UnityEditor.PropertyDrawer
    {
        public override void OnGUI(UnityEngine.Rect position, UnityEditor.SerializedProperty property, UnityEngine.GUIContent label)
        {
        }

        public override float GetPropertyHeight(UnityEditor.SerializedProperty property, UnityEngine.GUIContent label)
        {
            return base.GetPropertyHeight(property, label);
        }
    }
}
