#!/usr/bin/env nu

# OS Query
alias ossql = ^osqueryi

# Run specified os query
def --env "os query" [
    $query: string # OSQuery SQL query
] {
    return (^osqueryi --json $query | from json)
}

# Run specified os query as dataframe (you can use dfr query "SELECT * FROM df")
def --env "os query dfr" [
    $query: string # OSQuery SQL query
] {
    if (which polars | is-not-empty) {
        return (^osqueryi --json $query | from json | polars into-df)
    }
    return (^osqueryi --json $query | from json | dfr into-df)
}
