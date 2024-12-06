set shell := ["nu", "-c"]

# Switch to .NET 8.0 using mise
[no-cd]
[group("net-version")]
use-net8:
    mise use dotnet@8.0

# Switch to .NET 9.0 using mise
[no-cd]
[group("net-version")]
use-net9:
    mise use dotnet@9.0

# Switch to .NET version from .toolversions using mise
[no-cd]
[group("net-version")]
use-toolversions:
    mise install

# Add specified package to specified project using dotnet cli
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
# Package name: name of package from nuget.org
# Additional arguments can be provided if needed
[no-cd]
[group("package-management")]
[doc("Add specified package to specified project using dotnet cli")]
add-pkg PROJECT_FILE PACKAGE_NAME +arguments:
    dotnet add {{PROJECT_FILE}} package {{PACKAGE_NAME}} {{arguments}}

# Add specified project to specified solution using dotnet cli
# Solution file: *.sln
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
# Additional arguments can be provided if needed
[no-cd]
[group("solution-management")]
[doc("Add specified project to specified solution using dotnet cli")]
add-proj-to-sln SOLUTION_FILE PROJECT_FILE +arguments:
    dotnet sln {{SOLUTION_FILE}} add {{PROJECT_FILE}} {{arguments}}

# Build specified project using dotnet cli
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
# Additional arguments can be provided if needed
[no-cd]
[group("build")]
[doc("Build specified project using dotnet cli")]
build-proj PROJECT_FILE +arguments:
    dotnet build {{PROJECT_FILE}} {{arguments}}

# Build specified solution using dotnet cli
# Solution file: *.sln
# Additional arguments can be provided if needed
[no-cd]
[group("build")]
[doc("Build specified solution using dotnet cli")]
build-sln SOLUTION_FILE +arguments:
    dotnet build {{SOLUTION_FILE}} {{arguments}}

# Clean specified project using dotnet cli
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
[no-cd]
[group("build")]
[doc("Clean specified project using dotnet cli")]
clean-proj PROJECT_FILE +arguments:
    dotnet clean {{PROJECT_FILE}} {{arguments}}

# Clean specified solution using dotnet cli
# Solution file: *.sln
[no-cd]
[group("build")]
[doc("Clean specified solution using dotnet cli")]
clean-sln SOLUTION_FILE +arguments:
    dotnet clean {{SOLUTION_FILE}} {{arguments}}

# Rebuild specified project using dotnet cli
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
[no-cd]
[group("build")]
[doc("Rebuild specified project using dotnet cli")]
rebuild-proj PROJECT_FILE:
    dotnet clean {{PROJECT_FILE}}
    dotnet build {{PROJECT_FILE}}

# Rebuild specified solution using dotnet cli
# Solution file: *.sln
[no-cd]
[group("build")]
[doc("Rebuild specified solution using dotnet cli")]
rebuild-sln SOLUTION_FILE:
    dotnet clean {{SOLUTION_FILE}}
    dotnet build {{SOLUTION_FILE}}

# Remove specified package from specified project using dotnet cli
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
# Package name: name of package from nuget.org
# Additional arguments can be provided if needed
[no-cd]
[group("package-management")]
[doc("Remove specified package from specified project using dotnet cli")]
rm-pkg PROJECT_FILE PACKAGE_NAME +arguments:
    dotnet remove {{PROJECT_FILE}} package {{PACKAGE_NAME}} {{arguments}}

# Remove specified project from specified solution using dotnet cli
# Solution file: *.sln
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
# Additional arguments can be provided if needed
[no-cd]
[group("solution-management")]
[doc("Remove specified project from specified solution using dotnet cli")]
rm-proj-from-sln SOLUTION_FILE PROJECT_FILE +arguments:
    dotnet sln {{SOLUTION_FILE}} remove {{PROJECT_FILE}} {{arguments}}

# Run all tests
# Additional arguments can be provided if needed
[no-cd]
[group("test")]
[doc("Run all tests")]
test +arguments:
    dotnet test {{arguments}}

# Run specified project using specified configuration
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
# Configuration: Release or Debug or other defined
# Additional arguments can be provided if needed
[no-cd]
[group("run")]
[doc("Run specified project using specified configuration")]
run-proj PROJECT_FILE CONFIGURATION +arguments:
    dotnet run --project {{PROJECT_FILE}} --configuration {{CONFIGURATION}} {{arguments}}

# Run specified project as MonoGame project
# MonoGame projects need some dark magic of options to run correctly
# Project file: *.csproj or *.fsproj or *.vbproj or *.shproj or *.dbproj or *.xproj
# Additional arguments can be provided if needed
[no-cd]
[group("run")]
[doc("Run specified project as MonoGame project")]
run-monogame-proj PROJECT_FILE +arguments:
    dotnet run -c Release -r linux-x64 /p:PublishReadyToRun=false /p:TieredCompilation=false --self-contained --project {{PROJECT_FILE}} {{arguments}}
