platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='Linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
  platform='Mac'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='Mac'
else
  echo "*** Oops! We can't detect your operating system! ***"
fi
set -o vi
export JRUBY_OPTS="--1.9 -J-XX:+TieredCompilation"
export NODE_PATH=/home/jimmy/Git/node/node_modules
if [[ $platform == 'Linux' ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
  eval "$(rbenv init -)"
  export PATH=$PATH:/usr/lib/jvm/java-7-openjdk-amd64/jre/bin
  export SELENIUM_SERVER_JAR=/home/jimmy/lib/selenium-server-standalone-2.24.1.jar
  alias ls='ls --color=auto'
elif [[ $platform == 'Mac' ]]; then
  alias ls='ls -G'
fi
alias grep='grep --color=auto'
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

# Hedgeye only
if [[ $platform == 'Mac' ]]; then
  export PATH="/usr/local/bin:$PATH"

  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

  # Path to the bash it configuration
  export BASH_IT="/Users/jlavin/.bash_it"

  # Lock and Load a custom theme file
  export BASH_IT_THEME="bobby"

  # Load Bash It
  source $BASH_IT/bash_it.sh
elif [[ $platform == 'Linux' ]]; then
  echo "*** Hooray! You're using Linux! ***"
else
  echo "*** Oops. We can't detect your operating system! ***"
fi
