#!/usr/bin/env nu

def --env notify [
    $title: string,
    $body: string
] {
    echo $"\e]777;notify;($title);($body)\e\\"
}
