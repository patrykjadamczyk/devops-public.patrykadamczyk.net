#!/usr/bin/env nu

# glob $"($env.FILE_PWD | path expand)/*.nu" --exclude [$"**/Install.nu"]
#     | each {
#         ^nu $"($in)"
#         "" # Return
#     }
