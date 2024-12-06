;; dockerfile
FROM ubuntu:latest
LABEL authors="{{_USER_}}"

ENTRYPOINT ["top", "-b"]
