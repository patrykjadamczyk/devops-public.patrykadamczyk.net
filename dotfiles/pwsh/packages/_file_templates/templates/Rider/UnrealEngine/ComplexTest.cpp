#include "Misc/AutomationTest.h"

IMPLEMENT_COMPLEX_AUTOMATION_TEST($CLASS_NAME$, "$NAMESPACE$.$SELSTART$$CLASS_NAME$$SELEND$", EAutomationTestFlags::EditorContext | EAutomationTestFlags::EngineFilter)

void $CLASS_NAME$::GetTests(TArray<FString>& OutBeautifiedNames, TArray <FString>& OutTestCommands) const
{
}

bool $CLASS_NAME$::RunTest(const FString& Parameters)
{
    return true;
}
