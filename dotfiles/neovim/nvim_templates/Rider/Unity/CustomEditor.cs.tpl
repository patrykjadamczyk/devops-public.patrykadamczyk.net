;; cs
{{_HEADER_}}
namespace {{_NAMESPACE_}} {
    [UnityEditor.CustomEditor(typeof({{_TYPE_}}))]
    public class {{_CLASS_}} : UnityEditor.Editor
    {
        public override void OnInspectorGUI()
        {
            base.OnInspectorGUI();
        }
    }
}
