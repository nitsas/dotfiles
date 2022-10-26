# TODO: Get work-stuff from other bash_profile sections

# -
# command to make `gist` command work with Skroutz's GitHub Enterprise
alias gist-skroutz="export GITHUB_URL=https://github.skroutz.gr/"
# run it
gist-skroutz
# command to make `gist` command work with public GitHub
alias gist-public="unset GITHUB_URL"
# which github is `gist` set to use?
alias gist-which='echo "${GITHUB_URL:-https://github.com/}"'

# -
alias til-update="gist -o -u 78b603d6a44dcebec7928f17d536fccb -f til-backup.md $TILFILE"

# -
# bufo reset & install new gems and js packages & migrate & prepare test db
alias bufo-reset-plus="bufo reset && bi && yarn && yarn build:ssr && bk db:migrate && bk db:test:prepare"
alias burp="bufo-reset-plus"

# -
# Disable spring (TEMP):
# export DISABLE_SPRING=1

# -
# aliases:
# set which flavor to use
alias skroutz="YOGURT_FLAVOR=skroutz"
alias alve="YOGURT_FLAVOR=alve"
alias scrooge="YOGURT_FLAVOR=scrooge"
# switch to yogurt dir and start rails server
# alias yogurt="cd ~/Skroutz/yogurt && bin/rails server -b 0.0.0.0"
alias yogurt="cd ~/Skroutz/yogurt && overmind start"
# run yogurt's rails server only
alias yogurt-debug="cd ~/Skroutz/yogurt && bin/rails server -b 0.0.0.0"
# switch to yogurt dir and start webpack server
alias yogurt-js="cd ~/Skroutz/yogurt && yarn server -- --host=0.0.0.0"
# switch to cashier dir and start server
alias cashier="cd ~/Skroutz/cashier && bin/rails server -p 4000 -b 0.0.0.0"
# switch to transporter dir and start server
alias transporter="cd ~/Skroutz/transporter && bin/rails server -p 6000 -b 0.0.0.0"
# switch to yogurt-test-box dir and start the vm
alias yogurt-test-box="cd ~/Skroutz/yogurt-test-box && docker-compose up -d"

# -
# Replay resque & beanstalkd failed jobs from your command line.
# see: https://phabricator.skroutz.gr/w/dev_stuff/background_job_replay/
alias jobreplay="ssh -t wowbagger@sentry.skroutz.gr replay-"

# -
# connect to kowalski (where jenkins runs)
alias kowalski="ssh wowbagger@kowalski.hq.skroutz.gr"
# staging
alias stg="ssh wowbagger@vms.skroutz.gr"
# logs
alias syslog="ssh ${USER}@syslog.skroutz.gr"
alias syslog-cashier="ssh ${USER}@syslog.pci.skroutz.gr"
# connect to staging (default ecommerce)
function staging() { ssh "${USER}@app.${1:-ecommerce}.st.skroutz.gr"; }

alias bufo-redis='docker run --entrypoint "" -ti yogurttestbox_redis redis-cli -h nitsas.bufo.skroutz.gr'

# -
# load tmux work session
alias work="tmux source-file ~/.tmux/work_session"

# -
# open tmux window
alias window-transporter-rb="tmux new-window -n transporter.rb -c ~/Skroutz/transporter.rb"
alias window-transporter="tmux new-window -n transporter -c ~/Skroutz/transporter"
alias window-analytics-server="tmux new-window -n analytics_server -c ~/Skroutz/analytics_server"
alias window-cashier="tmux new-window -n cashier -c ~/Skroutz/cashier"
alias window-skroutzstores="tmux new-window -n skroutzstores -c ~/Skroutz/skroutzstores"
alias window-happydev="tmux new-window -n happydev -c ~/Skroutz/yogurt"
alias window-yogurt-test-box="tmux new-window -n yogurt_test_box -c ~/Skroutz/yogurt-test-box"
alias window-puppet="tmux new-window -n puppet -c ~/Skroutz/puppet"
alias window-rails="tmux new-window -n rails -c ~/repos/github/rails/rails"
alias window-zeypay="tmux new-window -n zeypay -c ~/Skroutz/zeypay"

function pr_for {
  git log --merges --oneline --ancestry-path $1..master | grep 'pull request' | tail -n1 | awk '{ print $5 }' | cut -c2- | xargs -I  % echo 'https://github.skroutz.gr/skroutz/yogurt/pull/%'
}
