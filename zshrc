# Homebrew (macOS)
if [[ -f /opt/homebrew/bin/brew ]]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

# rbenv
if command -v rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi

bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

alias ll="ls -l"
export PATH="~/bin:$PATH"
if [[ -d /opt/homebrew/opt/postgresql@12/bin ]]; then
  export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
fi

if [[ -d /opt/homebrew/share/zsh/site-functions ]]; then
  fpath+=(/opt/homebrew/share/zsh/site-functions/prompt_spaceship_setup)
fi

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
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# https://github.com/tarjoilija/zgen
# apt installs to /usr/share/zgen, git clone installs to ~/.zgen
if [[ -s "${HOME}/.zgen/zgen.zsh" ]]; then
  source "${HOME}/.zgen/zgen.zsh"
elif [[ -s /usr/share/zgen/zgen.zsh ]]; then
  source /usr/share/zgen/zgen.zsh
fi

if command -v zgen &> /dev/null && ! zgen saved; then
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

if [[ -d /opt/homebrew/opt/node@14/bin ]]; then
  export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
fi
if [[ -d /opt/homebrew/opt/grep/libexec/gnubin ]]; then
  PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
fi

alias grep="grep --color=always --exclude='*coverage*' --exclude='tags' --exclude-dir=.git"

# Machine-specific prompt
if [[ "$(hostname)" == "gibson" ]]; then
  export PS1="%~ ⚡ "
else
  export PS1="%~ 👻 "
fi

if [[ -s "$HOME/.dotfiles/secrets" ]]
then
  source "$HOME/.dotfiles/secrets"
fi
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# make zsh do tab completion like bash
setopt noautomenu
setopt nomenucomplete
export PATH="$HOME/.local/bin:$PATH"
