#!/usr/bin/env pwsh
if ($_IsLinux) {
    # Force correct scaling on Linux with X11
    $env:WINIT_X11_SCALE_FACTOR=1
}
