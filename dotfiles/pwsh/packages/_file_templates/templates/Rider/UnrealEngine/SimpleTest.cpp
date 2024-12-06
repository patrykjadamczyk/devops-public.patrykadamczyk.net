#include "Misc/AutomationTest.h"

IMPLEMENT_SIMPLE_AUTOMATION_TEST($CLASS_NAME$, "$NAMESPACE$.$CLASS_NAME$", EAutomationTestFlags::EditorContext | EAutomationTestFlags::EngineFilter)

bool $CLASS_NAME$::RunTest(const FString& Parameters)
{
    // Make the test pass by returning true, or fail by returning false.
    return true;
}
