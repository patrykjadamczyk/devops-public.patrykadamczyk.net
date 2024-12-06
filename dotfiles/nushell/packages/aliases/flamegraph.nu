#!/usr/bin/env nu

def --env --wrapped "flamegraph" [...$args] {
    if (which flamegraph | is-empty) {
        if (which cargo | is-not-empty) {
            pm install rust flamegraph
        } else {
            print $"(ansi red)flamegraph command not found and golang not found(ansi reset)"
        }
    }
    let old = (cat /proc/sys/kernel/perf_event_paranoid)
    echo "-1" | sudo tee /proc/sys/kernel/perf_event_paranoid
    $in | ^flamegraph ...$args
    echo $old | sudo tee /proc/sys/kernel/perf_event_paranoid
}