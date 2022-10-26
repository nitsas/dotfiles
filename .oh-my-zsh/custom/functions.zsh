function docker_connect() {
  docker exec -it $(docker ps | grep $1 | head -1 | awk '{ print $1 }') bash
}

# clip command that copies the given arguments to the clipboard
function clip() {
  echo -n "$*" | pbcopy
}
