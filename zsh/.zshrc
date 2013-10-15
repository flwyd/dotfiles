# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Completion
zstyle :compinstall filename '/home/tstone/.zshrc'
autoload -Uz compinit
compinit
# Don't constantly reparse for completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /tmp/$USER/zsh/cache

# Colors
autoload -Uz colors
colors

# Version control support
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%b|%a'
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' enable 'git'

# zsh options
setopt \
  appendhistory \
  auto_continue \
  auto_menu \
  auto_pushd \
  beep \
  check_jobs \
  noclobber \
  complete_in_word \
  correct \
  extended_history \
  hist_expire_dups_first \
  hist_no_store \
  hist_reduce_blanks \
  hist_save_no_dups \
  inc_append_history \
  list_packed \
  multios \
  notify \
  prompt_cr \
  noprompt_sp \
  short_loops

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Command line editing and prompting
PROMPT=$'%B%F{red}%?%f%b %F{green}%T%f %B%F{magenta}%!%f%b%# '
RPROMPT='%S%4~%s'
WORDCHARS=${WORDCHARS//[&=\/;\!#%.-]}
bindkey -e
# Automatic functions
typeset -ga chpwd_functions
typeset -ga precmd_functions
typeset -ga preexec_functions

# Set window title to directory, etc
precmd_functions+='set_xterm_title'

# Functions and aliases
typeset -U fpath
fpath=($ZDOTDIR/functions $fpath)
autoload -U $ZDOTDIR/functions/*(:t)
source $ZDOTDIR/.zshaliases
