# command that moves you up the directory tree:
function up() {
  up_cmd_arg=$1
  # if the argument is the empty string (string length is zero) travel up 1 dir
  if [ -z $1 ]
  then
    up_cmd_arg=1
  fi
  # make sure that i contains a number
  up_cmd_re='^[0-9]+$'
  if ! [[ $up_cmd_arg =~ $up_cmd_re ]]
  then
    echo "usage: up [how_many_dirs]"; return 1
  fi
  # tell python to construct the target dir path (we could also get to
  # the target dir using a loop of "cd .." but then OLDPWD would be wrong)
  up_cmd_py_cmd_start="print('../'*"
  up_cmd_target_path=`/usr/bin/env python -c $up_cmd_py_cmd_start$up_cmd_arg")"`
  # jump
  cd $up_cmd_target_path
}

function docker_connect() {
  docker exec -it $(docker ps | grep $1 | head -1 | awk '{ print $1 }') bash
}

# clip command that copies the given arguments to the clipboard
function clip() {
  echo -n "$*" | pbcopy
}
