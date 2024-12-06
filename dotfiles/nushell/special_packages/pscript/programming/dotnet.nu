#!/usr/bin/env nu

# Add package to project
export def add-pkg [] {
    let $ProjectList = ([
        # C# Project
        (try { ls **/*.csproj | where type == "file" | select name } catch { [] })
        # F# Project
        (try { ls **/*.fsproj | where type == "file" | select name } catch { [] })
        # Visual Basic Project
        (try { ls **/*.vbproj | where type == "file" | select name } catch { [] })
        # Shared Project
        (try { ls **/*.shproj | where type == "file" | select name } catch { [] })
        # Database Project
        (try { ls **/*.dbproj | where type == "file" | select name } catch { [] })
        # Old ASP.NET Project (according to Phind)
        (try { ls **/*.xproj | where type == "file" | select name } catch { [] })
    ] | flatten)

    if ($ProjectList | is-empty) {
        print -e "Error: Couldn't find any project file in current directory"
        return
    }

    let $invokeProject = if (($ProjectList | count) > 1) {
        $ProjectList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose project to use > "
    } else {
        $ProjectList.0.name
    }

    print $"Using project: ($invokeProject)"

    let $packageName = (input "Specify package to install > ")

    let $additionalArguments = (input "Specify additional arguments to add package command > ")

    print $"Executing: dotnet add ($invokeProject) package ($packageName) ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) add ($invokeProject) package ($packageName) ($additionalArguments); exit"
}

# Remove package to project
export def remove-pkg [] {
    let $ProjectList = ([
        # C# Project
        (try { ls **/*.csproj | where type == "file" | select name } catch { [] })
        # F# Project
        (try { ls **/*.fsproj | where type == "file" | select name } catch { [] })
        # Visual Basic Project
        (try { ls **/*.vbproj | where type == "file" | select name } catch { [] })
        # Shared Project
        (try { ls **/*.shproj | where type == "file" | select name } catch { [] })
        # Database Project
        (try { ls **/*.dbproj | where type == "file" | select name } catch { [] })
        # Old ASP.NET Project (according to Phind)
        (try { ls **/*.xproj | where type == "file" | select name } catch { [] })
    ] | flatten)

    if ($ProjectList | is-empty) {
        print -e "Error: Couldn't find any project file in current directory"
        return
    }

    let $invokeProject = if (($ProjectList | count) > 1) {
        $ProjectList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose project to use > "
    } else {
        $ProjectList.0.name
    }

    print $"Using project: ($invokeProject)"

    let $packageName = (input "Specify package to install > ")

    let $additionalArguments = (input "Specify additional arguments to remove package command > ")

    print $"Executing: dotnet remove ($invokeProject) package ($packageName) ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) remove ($invokeProject) package ($packageName) ($additionalArguments); exit"
}

# Add project to solution
export def add-project-to-solution [] {
    let $SolutionList = (ls **/*.sln | where type == "file")

    if ($SolutionList | is-empty) {
        print -e "Error: Couldn't find any solution file in current directory"
        return
    }

    let $invokeSolution = if (($SolutionList | count) > 1) {
        $SolutionList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose solution to use > "
    } else {
        $SolutionList.0.name
    }

    print $"Using solution: ($invokeSolution)"

    let $ProjectList = ([
        # C# Project
        (try { ls **/*.csproj | where type == "file" | select name } catch { [] })
        # F# Project
        (try { ls **/*.fsproj | where type == "file" | select name } catch { [] })
        # Visual Basic Project
        (try { ls **/*.vbproj | where type == "file" | select name } catch { [] })
        # Shared Project
        (try { ls **/*.shproj | where type == "file" | select name } catch { [] })
        # Database Project
        (try { ls **/*.dbproj | where type == "file" | select name } catch { [] })
        # Old ASP.NET Project (according to Phind)
        (try { ls **/*.xproj | where type == "file" | select name } catch { [] })
    ] | flatten)

    if ($ProjectList | is-empty) {
        print -e "Error: Couldn't find any project file in current directory"
        return
    }

    let $invokeProject = if (($ProjectList | count) > 1) {
        $ProjectList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose project to use > "
    } else {
        $ProjectList.0.name
    }

    print $"Using project: ($invokeProject)"

    let $additionalArguments = (input "Specify additional arguments to sln command > ")

    print $"Executing: dotnet sln ($invokeSolution) add ($invokeProject) ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) sln ($invokeSolution) add ($invokeProject) ($additionalArguments); exit"
}

# Remove project to solution
export def remove-project-to-solution [] {
    let $SolutionList = (ls **/*.sln | where type == "file")

    if ($SolutionList | is-empty) {
        print -e "Error: Couldn't find any solution file in current directory"
        return
    }

    let $invokeSolution = if (($SolutionList | count) > 1) {
        $SolutionList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose solution to use > "
    } else {
        $SolutionList.0.name
    }

    print $"Using solution: ($invokeSolution)"

    let $ProjectList = ([
        # C# Project
        (try { ls **/*.csproj | where type == "file" | select name } catch { [] })
        # F# Project
        (try { ls **/*.fsproj | where type == "file" | select name } catch { [] })
        # Visual Basic Project
        (try { ls **/*.vbproj | where type == "file" | select name } catch { [] })
        # Shared Project
        (try { ls **/*.shproj | where type == "file" | select name } catch { [] })
        # Database Project
        (try { ls **/*.dbproj | where type == "file" | select name } catch { [] })
        # Old ASP.NET Project (according to Phind)
        (try { ls **/*.xproj | where type == "file" | select name } catch { [] })
    ] | flatten)

    if ($ProjectList | is-empty) {
        print -e "Error: Couldn't find any project file in current directory"
        return
    }

    let $invokeProject = if (($ProjectList | count) > 1) {
        $ProjectList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose project to use > "
    } else {
        $ProjectList.0.name
    }

    print $"Using project: ($invokeProject)"

    let $additionalArguments = (input "Specify additional arguments to sln command > ")

    print $"Executing: dotnet sln ($invokeSolution) add ($invokeProject) ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) sln ($invokeSolution) remove ($invokeProject) ($additionalArguments); exit"
}

# Build project
export def build [] {
    let $ProjectList = ([
        # C# Project
        (try { ls **/*.csproj | where type == "file" | select name } catch { [] })
        # F# Project
        (try { ls **/*.fsproj | where type == "file" | select name } catch { [] })
        # Visual Basic Project
        (try { ls **/*.vbproj | where type == "file" | select name } catch { [] })
        # Shared Project
        (try { ls **/*.shproj | where type == "file" | select name } catch { [] })
        # Database Project
        (try { ls **/*.dbproj | where type == "file" | select name } catch { [] })
        # Old ASP.NET Project (according to Phind)
        (try { ls **/*.xproj | where type == "file" | select name } catch { [] })
    ] | flatten)

    if ($ProjectList | is-empty) {
        print -e "Error: Couldn't find any project file in current directory"
        return
    }

    let $invokeProject = if (($ProjectList | count) > 1) {
        $ProjectList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose project to use > "
    } else {
        $ProjectList.0.name
    }

    print $"Using project: ($invokeProject)"

    let $additionalArguments = (input "Specify additional arguments to build command > ")

    print $"Executing: dotnet build ($invokeProject) ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) build ($invokeProject) ($additionalArguments); exit"
}

# Build solution
export def build-solution [] {
    let $SolutionList = (ls **/*.sln | where type == "file")

    if ($SolutionList | is-empty) {
        print -e "Error: Couldn't find any solution file in current directory"
        return
    }

    let $invokeSolution = if (($SolutionList | count) > 1) {
        $SolutionList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose solution to use > "
    } else {
        $SolutionList.0.name
    }

    print $"Using solution: ($invokeSolution)"

    let $additionalArguments = (input "Specify additional arguments to build command > ")

    print $"Executing: dotnet ($invokeSolution) build ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) build ($invokeSolution) ($additionalArguments); exit"
}

# Clean project
export def clean [] {
    let $ProjectList = ([
        # C# Project
        (try { ls **/*.csproj | where type == "file" | select name } catch { [] })
        # F# Project
        (try { ls **/*.fsproj | where type == "file" | select name } catch { [] })
        # Visual Basic Project
        (try { ls **/*.vbproj | where type == "file" | select name } catch { [] })
        # Shared Project
        (try { ls **/*.shproj | where type == "file" | select name } catch { [] })
        # Database Project
        (try { ls **/*.dbproj | where type == "file" | select name } catch { [] })
        # Old ASP.NET Project (according to Phind)
        (try { ls **/*.xproj | where type == "file" | select name } catch { [] })
    ] | flatten)

    if ($ProjectList | is-empty) {
        print -e "Error: Couldn't find any project file in current directory"
        return
    }

    let $invokeProject = if (($ProjectList | count) > 1) {
        $ProjectList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose project to use > "
    } else {
        $ProjectList.0.name
    }

    print $"Using project: ($invokeProject)"

    let $additionalArguments = (input "Specify additional arguments to clean command > ")

    print $"Executing: dotnet clean ($invokeProject) ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) clean ($invokeProject) ($additionalArguments); exit"
}

# Clean solution
export def clean-solution [] {
    let $SolutionList = (ls **/*.sln | where type == "file")

    if ($SolutionList | is-empty) {
        print -e "Error: Couldn't find any solution file in current directory"
        return
    }

    let $invokeSolution = if (($SolutionList | count) > 1) {
        $SolutionList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose solution to use > "
    } else {
        $SolutionList.0.name
    }

    print $"Using solution: ($invokeSolution)"

    let $additionalArguments = (input "Specify additional arguments to clean command > ")

    print $"Executing: dotnet ($invokeSolution) clean ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) clean ($invokeSolution) ($additionalArguments); exit"
}
# Rebuild project
export def rebuild [] {
    let $ProjectList = ([
        # C# Project
        (try { ls **/*.csproj | where type == "file" | select name } catch { [] })
        # F# Project
        (try { ls **/*.fsproj | where type == "file" | select name } catch { [] })
        # Visual Basic Project
        (try { ls **/*.vbproj | where type == "file" | select name } catch { [] })
        # Shared Project
        (try { ls **/*.shproj | where type == "file" | select name } catch { [] })
        # Database Project
        (try { ls **/*.dbproj | where type == "file" | select name } catch { [] })
        # Old ASP.NET Project (according to Phind)
        (try { ls **/*.xproj | where type == "file" | select name } catch { [] })
    ] | flatten)

    if ($ProjectList | is-empty) {
        print -e "Error: Couldn't find any project file in current directory"
        return
    }

    let $invokeProject = if (($ProjectList | count) > 1) {
        $ProjectList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose project to use > "
    } else {
        $ProjectList.0.name
    }

    print $"Using project: ($invokeProject)"

    let $cleanAdditionalArguments = (input "Specify additional arguments to clean command > ")
    let $buildAdditionalArguments = (input "Specify additional arguments to build command > ")

    print $"Executing: dotnet clean ($invokeProject) ($cleanAdditionalArguments)"
    print $"And: dotnet build ($invokeProject) ($buildAdditionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) clean ($invokeProject) ($cleanAdditionalArguments); ($dotnetBin) build ($invokeProject) ($buildAdditionalArguments); exit"
}

# Rebuild solution
export def rebuild-solution [] {
    let $SolutionList = (ls **/*.sln | where type == "file")

    if ($SolutionList | is-empty) {
        print -e "Error: Couldn't find any solution file in current directory"
        return
    }

    let $invokeSolution = if (($SolutionList | count) > 1) {
        $SolutionList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose solution to use > "
    } else {
        $SolutionList.0.name
    }

    print $"Using solution: ($invokeSolution)"

    let $cleanAdditionalArguments = (input "Specify additional arguments to clean command > ")
    let $buildAdditionalArguments = (input "Specify additional arguments to build command > ")

    print $"Executing: dotnet clean ($invokeSolution) ($cleanAdditionalArguments)"
    print $"And: dotnet build ($invokeSolution) ($buildAdditionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) clean ($invokeSolution) ($cleanAdditionalArguments); ($dotnetBin) build ($invokeSolution) ($buildAdditionalArguments); exit"
}

# Run all tests
export def run-all-tests [] {
    let $additionalArguments = (input "Specify additional arguments to test command > ")

    print $"Executing: dotnet test ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) test ($additionalArguments); exit"
}

# Run project
export def run [] {
    let $ProjectList = ([
        # C# Project
        (try { ls **/*.csproj | where type == "file" | select name } catch { [] })
        # F# Project
        (try { ls **/*.fsproj | where type == "file" | select name } catch { [] })
        # Visual Basic Project
        (try { ls **/*.vbproj | where type == "file" | select name } catch { [] })
        # Shared Project
        (try { ls **/*.shproj | where type == "file" | select name } catch { [] })
        # Database Project
        (try { ls **/*.dbproj | where type == "file" | select name } catch { [] })
        # Old ASP.NET Project (according to Phind)
        (try { ls **/*.xproj | where type == "file" | select name } catch { [] })
    ] | flatten)

    if ($ProjectList | is-empty) {
        print -e "Error: Couldn't find any project file in current directory"
        return
    }

    let $invokeProject = if (($ProjectList | count) > 1) {
        $ProjectList
            | each { $in.name }
            | str join (char nl)
            | fzf --prompt "Choose project to use > "
    } else {
        $ProjectList.0.name
    }

    print $"Using project: ($invokeProject)"

    let $configurations = ["Debug" "Release"]
    let $invokeConfiguration = $configurations
            | str join (char nl)
            | fzf --prompt "Choose configuration to use > "

    # try {
    #     $invokeProjectXml = [xml](Get-Content $invokeProject)
    #     $invokeProjectConfigurationsXml = $invokeProjectXml
    #         | Select-Xml -XPath "/Project/PropertyGroup/Configurations"
    #         | ForEach-Object { $_.Node.InnerText }
    #     $configurations = $invokeProjectConfigurationsXml.Split(";")
    # } catch {
    # }
    #
    # $invokeConfiguration = $configurations
    #     | Invoke-Fzf -Prompt "Choose configuration to use > "

    print $"Using configuration: ($invokeConfiguration)"


    let $additionalArguments = (input "Specify additional arguments to clean command > ")

    print $"Executing: dotnet run --project ($invokeProject) --configuration ($invokeConfiguration) ($additionalArguments)"

    let $dotnetBin = (which dotnet).0.path
    ^nu -e $"($dotnetBin) run --project ($invokeProject) --configuration ($invokeConfiguration) ($additionalArguments); exit"
}

# Install templates
export def install-templates [] {
    # URL: https://github.com/dotnet/templating/wiki/Available-templates-for-dotnet-new
    dotnet new install "Boxed.Templates"
    dotnet new install "Avalonia.Templates"
    # dotnet new install "Microsoft.AspNetCore.Blazor.Templates::3.0.0-*"
    dotnet new install "CarterTemplate"
    dotnet new install "FriscoVInc.DotNet.Templates.CleanBlazor"
    dotnet new install "DotVVM.Templates"
    dotnet new install GCC.Build.Template
    dotnet new install "GtkSharp.Template.CSharp"
    dotnet new install "MonoGame.Templates.CSharp"
    dotnet new install "Paulovich.Caju"
    dotnet new install "Paulovich.Manga"
    dotnet new install "FiftyProtons.Templates.PSCore"
    dotnet new install "RaspberryPi.Template"
    dotnet new install "FiftyProtons.Templates.DotNetNew"
    dotnet new install "eisk.webapi"
    dotnet new install "WebAPI.FSharp.Template"
    dotnet new install Bolero.Templates
    dotnet new install "Fable.Template.Elmish.React"
    dotnet new install "Fable.Template"
    dotnet new install "Fable.Template.Library"
    dotnet new install "GtkSharp.Template.FSharp"
    dotnet new install "MiniScaffold"
}
