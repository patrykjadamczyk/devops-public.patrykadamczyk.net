;; cs
{{_HEADER_}}
namespace {{_NAMESPACE_}} {
    public class {{_CLASS_}} {
        [NUnit.Framework.Test]
        public void {{_CLASS_}}SimplePasses() {
            // Use the Assert class to test conditions.
        }

        // A UnityTest behaves like a coroutine in PlayMode
        // and allows you to yield null to skip a frame in EditMode
        [UnityEngine.TestTools.UnityTest]
        public System.Collections.IEnumerator {{_CLASS_}}WithEnumeratorPasses() {
            // Use the Assert class to test conditions.
            // yield to skip a frame
            yield return null;
        }
    }
}
