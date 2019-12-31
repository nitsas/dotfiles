# connect to panopticon
function panopticon() { ssh "wowbagger@panopticon.${1}${1:+.}skroutz.gr"; }

# connect to prefect
function prefect() {
  if [[ "$1" == "alve" ]]; then
    ssh wowbagger@prefect.alve.skroutz.gr
  elif [[ "$1" == "scrooge" ]]; then
    ssh wowbagger@prefect.scrooge.skroutz.gr
  else
    ssh wowbagger@prefect.skroutz.gr
  fi
}

# connect to kavula
function kavula() {
  if [[ "$1" == "alve" ]]; then
    echo 'No kavula on alve! Connecting to as1.alve.skroutz.gr..';
    ssh wowbagger@as1.alve.skroutz.gr
  elif [[ "$1" == "scrooge" ]]; then
    echo 'No kavula on scrooge! Connecting to as1.scrooge.skroutz.gr..';
    ssh wowbagger@as1.scrooge.skroutz.gr
  else
    ssh wowbagger@kavula.skroutz.gr
  fi
}
