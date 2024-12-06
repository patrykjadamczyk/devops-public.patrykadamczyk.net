#!/usr/bin/env pwsh
$global:Config_Godot4Title = "Godot Engine - Stable 4.0.2 - .NET";
$global:Config_Godot4Exec = "E:\Tools\Godot\Godot_v4.0.2-stable_mono_win64\Godot_v4.0.2-stable_mono_win64_console.exe";

# Alacritty - Godot 4.0.2
function Invoke-AlacrittyWithGodot4-0-2 {
    $Godot4Exec = "E:\Tools\Godot\Godot_v4.0.2-stable_mono_win64\Godot_v4.0.2-stable_mono_win64_console.exe"
    alacritty -T "Godot Engine - Stable 4.0.2 - .NET" -e pwsh -NoProfile -c $Godot4Exec $args
}