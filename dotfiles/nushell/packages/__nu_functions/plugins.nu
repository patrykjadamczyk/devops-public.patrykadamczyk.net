#!/usr/bin/env nu

try { plugin use gstat }
# try { plugin use periodic_table }
# try { plugin use net }
try { plugin use polars }
try { plugin use query }
# https://github.com/idanarye/nu_plugin_skim
# ps | sk --format {get name} --preview {}
try { plugin use skim }
# https://github.com/cptpiepmatz/nu-plugin-highlight
# open README.md | highlight
try { plugin use highlight }
