# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/ian.oxley/.oh-my-zsh

# export TERM=xterm-256color

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias todo="vim -o ~/{todo,progress,done}"

# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias be="bundle exec"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
# Clear the screen and scroll-back - like Cmd+K in iTerm
alias clear="clear && printf '\e[3J'"

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# fpath=(~/.zsh/functions $fpath)
# autoload -Uz compinit && compinit

autoload bashcompinit
bashcompinit

# aws
source /usr/local/etc/bash_completion.d/aws_bash_completer

# git
# if [ -e /usr/local/etc/bash_completion.d/git-completion.bash ]; then
#   zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
#   # `compinit` scans $fpath, so do this before calling it.
# fi
# source /usr/local/etc/bash_completion.d/git-prompt.sh

# grep
export GREP_OPTIONS='--color=always'

function aws_login() {
  aws ecr get-login-password | docker login --username AWS --password-stdin ${AWS_ECR_ACCOUNT_ID}.dkr.ecr.${AWS_ECR_ACCOUNT_REGION}.amazonaws.com
}

# 2019-02-15 The file below doens't exist, not sure if it should or not?
# source /usr/local/etc/bash_completion.d/docker-compose

# npm helpers
function npm-install-local {
  npm install $(npm pack $1 | tail -1)
}

# fzf
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  # source /usr/local/opt/fzf/shell/key-bindings.bash
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# ag
if [ -e /usr/local/etc/bash_completion.d/ag.bashcomp.sh ]; then
  source /usr/local/etc/bash_completion.d/ag.bashcomp.sh
fi

# fzf + ag configuration
if which -s fzf && which -s ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  # export FZF_DEFAULT_OPTS='
  # --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  # --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  # '
fi

# Add qmake to the PATH
# export PATH="/usr/local/opt/qt/bin:$PATH"
# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Taskwarrior
# if [ -e /usr/local/share/zsh/site-functions/_task ]; then
#   source /usr/local/share/zsh/site-functions/_task
# fi

# Disable history logging for jrnl
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"

# vim-gnupg
GPG_TTY=`tty`
export GPG_TTY
export PATH="/usr/local/opt/curl/bin:$PATH"

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Load secrets.sh from the home directory if it exists
if [ -e ~/.secrets.sh ]; then
  source ~/.secrets.sh
fi

# Ruby OpenSSL config
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
