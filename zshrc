export PATH=/opt/homebrew/bin:$PATH

eval "$(rbenv init -)"

bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

alias ll="ls -l"
export PATH="/opt/homebrew/opt/postgresql@12/bin:~/bin:$PATH"

fpath+=(/opt/homebrew/share/zsh/site-functions/prompt_spaceship_setup)

# add color to ls
export CLICOLOR=1

if [ -s "$HOMEBREW_PREFIX/etc/grc.zsh" ]; then
    source "${HOMEBREW_PREFIX}/etc/grc.zsh"
fi

# case insensitive auto complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# reload zstyle
autoload -Uz compinit && compinit


alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lah'
alias less='less -R' # parse control chars as colors
alias ag='ag --color'
alias ..="cd .."


# https://github.com/sorin-ionescu/prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# https://github.com/tarjoilija/zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  zgen prezto
  zgen prezto git
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto zsh-users/zsh-completions src
  zgen save
fi

# FIXME
# autoload -Uz promptinit
# promptinit
# prompt spaceship

export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

alias grep="grep --color=always --exclude='*coverage*' --exclude='tags' --exclude-dir=.git"
export PS1="%~ 👻 "

if [[ -s "$HOME/.dotfiles/secrets" ]]
then
  source "$HOME/.dotfiles/secrets"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"


# make zsh do tab completion like bash
setopt noautomenu
setopt nomenucomplete
