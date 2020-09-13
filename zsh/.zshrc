# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v
bindkey "^R" history-incremental-search-backward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/spacycoder/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

function powerline_precmd() {
    PS1="$($GOPATH/bin/powerline-go -cwd-max-depth 4 -cwd-max-dir-size 10 -modules 'venv,user,ssh,cwd,perms,git,hg,jobs,exit,root,kube' -newline -error $? -shell zsh)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

alias cd..="cd .."
alias ll="ls -la"
