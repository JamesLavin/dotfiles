set -o vi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

function detect_os {
  platform='unknown'
  unamestr=`uname`
  if [[ "$unamestr" == 'Linux' ]]; then
    platform='Linux'
  elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='Mac'
  elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='Mac'
  fi

  if [ "$platform" != "unknown" ]; then
    echo "Your platform has been detected to be '$platform'"
  else
    echo "*** Oops! We can't detect your operating system! ***"
  fi
}
detect_os

function run_machine_specific_bash {
  if [ -e ~/.machine_specific_bash ]; then
    echo "Running machine-specific bash script"
    . ~/.machine_specific_bash
  fi
}
run_machine_specific_bash

if [[ $platform == 'Linux' ]]; then
  export EDITOR=/usr/bin/vim
  alias ls='ls --color=auto'
elif [[ $platform == 'Mac' ]]; then
  alias ls='ls -G'
fi

alias grep='grep --color=auto'
alias g='grep -iIr --color=auto --exclude={jasmine-jquery.js,*.log,*.sql,*min.js,ext-all.js,*mobile.js,*.svg} --exclude-dir={.git,log,vendor/plugins,vendor/assets/stylesheets} '
alias pg91='/usr/lib/postgresql/9.1/bin/postgres -D /etc/postgresql/9.1/main'
alias dc='git diff --cached'
alias ga='git add '
alias grm='git rebase master'
alias gcom='git co master'
#alias gpo='git push origin `git rev-parse --abbrev-ref HEAD`'
#alias gpu='git pull upstream `git rev-parse --abbrev-ref HEAD`'
#alias gpum='git pull upstream master'
#alias gpom='git push origin master'
alias gpush='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gpull='git pull origin `git rev-parse --abbrev-ref HEAD`'
#alias tssbs='git pull upstream `git rev-parse --abbrev-ref HEAD`; git push origin `git rev-parse --abbrev-ref HEAD`'
#alias gpum='git pull upstream master'
#alias gpom='git push origin master'
alias be='bundle exec'
alias ber='bundle exec rspec '
alias bi='bundle install'
alias gl='git log'
alias gs='git status'
alias gitff='git grep -l --all-match -e '
alias searchgit='git log -Sword'
#alias gitfl='git log --all-match --grep='
 
if [[ $platform == 'Mac' ]]; then
  #export PATH="$HOME/Applications/Anaconda/anaconda/envs/py34/bin:$PATH"
  # added by Anaconda3 2.2.0 installer
  export PATH="/Users/jlavin/anaconda/bin:$PATH"
elif [[ $platform == 'Linux' ]]; then
  echo "*** Hooray! You're using Linux! ***"
  export PATH="$HOME/anaconda3/bin:$PATH"
else
  echo "*** Oops. We can't detect your operating system! ***"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Use pry as Rails console
alias pryr='pry -r ./config/environment'

# DOCKER
eval $(docker-machine env default)
alias d='docker '
alias dm='docker-machine '


if [ -f ~/.bashrc ]; then 
  source ~/.bashrc 
fi

if [[ -a ~/.localrc ]]; then
  source ~/.localrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
