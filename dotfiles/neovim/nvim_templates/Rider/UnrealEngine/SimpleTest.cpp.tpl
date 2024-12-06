;; cpp
#include "Misc/AutomationTest.h"

IMPLEMENT_SIMPLE_AUTOMATION_TEST({{_CLASS_NAME_}}, "{{_NAMESPACE_}}.{{_CLASS_NAME_}}", EAutomationTestFlags::EditorContext | EAutomationTestFlags::EngineFilter)

bool {{_CLASS_NAME_}}::RunTest(const FString& Parameters)
{
    // Make the test pass by returning true, or fail by returning false.
    return true;
}
