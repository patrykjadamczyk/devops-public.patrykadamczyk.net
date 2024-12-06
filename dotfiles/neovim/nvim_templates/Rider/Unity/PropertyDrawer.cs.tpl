;; cs
{{_HEADER_}}
namespace {{_NAMESPACE_}} {
    [UnityEditor.CustomPropertyDrawer(typeof({{_TYPE_}}))]
    public class {{_CLASS_}} : UnityEditor.PropertyDrawer
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
