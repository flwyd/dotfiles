# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Completion
zstyle :compinstall filename "${ZDOTDIR-$HOME}/.zshrc"
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*'
zstyle ':completion:*:default' list-prompt ''
# Don't constantly reparse for completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /tmp/$USER/zsh/cache
# git clone git://github.com/zsh-users/zsh-completions ~/.zsh-completions
fpath+="$HOME/.zsh-completions/src"
autoload -Uz compinit
compinit

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
  brace_ccl \
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

# Show Unicode characters in less
export LESSCHARSET='utf-8'

# Save REPL history in erlang and iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load fzf autocomplete and keybindings
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
  if command -v ag > /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -g ""'
    _fzf_compgen_path() {
      ag -g "" "$1"
    }
  fi
fi

# Command line editing and prompting
PROMPT=$'%B%F{red}%?%f%b %F{green}%T%f %B%F{magenta}%!%f%b%# '
RPROMPT='%S%4~%s'
WORDCHARS=${WORDCHARS//[&=\/;\!#%.-]}
bindkey -e
if [[ $OSTYPE =~ darwin ]]; then
  # forwards delete on MacOS X
  bindkey "^[[3~" delete-char
fi

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

# Parks on the Air filename format
potatemplate='{station_callsign}@{my_pota_ref}-{qso_date}.adi'

# Optionally load local additions
[[ -s ~/.abbreviations ]] && source ~/.abbreviations
[[ -s ~/.zshlocal/.zshrc ]] && source ~/.zshlocal/.zshrc
