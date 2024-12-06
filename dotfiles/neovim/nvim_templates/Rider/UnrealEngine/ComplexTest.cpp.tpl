;; cpp
#include "Misc/AutomationTest.h"

IMPLEMENT_COMPLEX_AUTOMATION_TEST({{_CLASS_NAME_}}, "{{_NAMESPACE_}}.{{_SELSTART_}}{{_CLASS_NAME_}}{{_SELEND_}}", EAutomationTestFlags::EditorContext | EAutomationTestFlags::EngineFilter)

void {{_CLASS_NAME_}}::GetTests(TArray<FString>& OutBeautifiedNames, TArray <FString>& OutTestCommands) const
{
}

bool {{_CLASS_NAME_}}::RunTest(const FString& Parameters)
{
    return true;
}
