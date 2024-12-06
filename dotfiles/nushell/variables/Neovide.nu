#!/usr/bin/env nu
if ($_IsLinux) {
    # Force correct scaling on Linux with X11
    $env.WINIT_X11_SCALE_FACTOR = 1
}
