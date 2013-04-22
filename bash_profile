set -o vi
export PATH="$HOME/.rbenv/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
export JRUBY_OPTS="--1.9 -J-XX:+TieredCompilation"
eval "$(rbenv init -)"
export PATH=$PATH:/usr/lib/jvm/java-7-openjdk-amd64/jre/bin
export SELENIUM_SERVER_JAR=/home/jimmy/lib/selenium-server-standalone-2.24.1.jar
export NODE_PATH=/home/jimmy/Git/node/node_modules
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias g='grep -iIr --color=auto --exclude={jasmine-jquery.js,*.log,*min.js,ext-all.js,*mobile.js,*.svg} --exclude-dir={.git,log,vendor/assets/stylesheets} '
alias pg91='/usr/lib/postgresql/9.1/bin/postgres -D /etc/postgresql/9.1/main'
alias specs='spork & sleep 60s & cd ~/Git/stylitics; bundle exec rspec spec'
alias dc='git diff --cached'
alias ga='git add '
alias grm='git rebase master'
alias gcom='git co master'
alias be='bundle exec'
alias ber='bundle exec rspec '
alias gitff='git grep -l --all-match -e '
alias searchgit='git log -Sword'
#alias gitfl='git log --all-match --grep='

#alias stylitics-qa='heroku pg:psql -a stylitics-qa'
#alias stylitics='heroku pg:psql -a stylitics'
