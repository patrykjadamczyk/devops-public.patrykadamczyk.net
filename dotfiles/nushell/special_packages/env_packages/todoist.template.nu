#!/usr/bin/env nu

# Add task to Todoist Inbox
def --env "add-to-todoist" [$taskName: string] {
    let $todoistToken = ""
    let $todoistInboxProjectId = ""
    let $todoistHeaders = ["Authorization" $"Bearer ($todoistToken)"]
    let $todoistTask = {"content": $taskName, "project_id": $todoistInboxProjectId}
    http post --content-type application/json --headers $todoistHeaders https://api.todoist.com/rest/v2/tasks $todoistTask
}


# Add task to Todoist Inbox
def --env "add-to-todoist-with-description" [$taskName: string, $taskDescription: string] {
    let $todoistToken = ""
    let $todoistInboxProjectId = ""
    let $todoistHeaders = ["Authorization" $"Bearer ($todoistToken)"]
    let $todoistTask = {"content": $taskName, "description": $taskDescription, "project_id": $todoistInboxProjectId}
    http post --content-type application/json --headers $todoistHeaders https://api.todoist.com/rest/v2/tasks $todoistTask
}
