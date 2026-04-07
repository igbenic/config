# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# git aliasi
# alias g="git add .; git commit -m"
# alias p="git push"

# flutter
export PATH="/Users/igbenic/.flutter/bin/:$PATH"

export ASPNETCORE_ENVIRONMENT=Development;
alias rport="ssh azureuser@rport.onix-pu.hr"
alias mcentral="ssh azureuser@mcentral.onix-pu.hr"
alias wakapi="ssh azureuser@wakapi.onix-pu.hr"
alias fer="ssh aduspara@161.53.19.97"
alias dcadmin="ssh dc_admin@rport.onix-pu.hr -p 28000";

export PLANTUML_LIMIT_SIZE=8192;
export WINEPREFIX=~/Library/Application\ Support/CrossOver/Bottles/Windows

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc ]]; then
    nvm use || nvm install
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PATH=$PATH:/Users/igbenic/Library/Android/sdk/platform-tools/
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
alias ibcontainers="ssh igbenic@containers.ib-tehnologije.hr -p 2222"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/igbenic/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

### IDRAC HTTPS ###
## https može i ovako: https://ibt.mgmt.tehnoline.hr:18888/restgui/start.html
### IDRAC HTTPS ###
alias ibidrac="ssh -J root@45.142.10.195:38007 root@ibt.mgmt.tehnoline.hr -p 18889"
alias ibproxmox="ssh root@45.142.10.195 -p 38007"
alias ibproxmoxui="ssh -L 8006:localhost:8006 root@45.142.10.195 -p 38007 -N"
alias ibidrachttps="ssh -L 8443:ibt.mgmt.tehnoline.hr:18888 root@45.142.10.195 -p 38007 -N"
alias ibrancherui="kubectl port-forward -n cattle-system svc/rancher 8443:443"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export KUBECONFIG=~/.kube/config:~/.kube/k3sHAconfig
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/igbenic/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

. "$HOME/.local/bin/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/igbenic/.lmstudio/bin"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
alias hs="ssh igbenic@homeserver.local"
alias hsz="ssh igbenic@10.121.15.240"
export PATH="/opt/homebrew/opt/libpq@16/bin:$PATH"
alias sl="osascript -e \"output volume of (get volume settings)\""
export PATH="$PATH:/Applications/Godot_mono.app/Contents/MacOS/"
alias tehnolinecharge="ssh tehnoline@91.98.127.222"
alias c="code ."

aic() {
  git add .;
  # Make sure we're in a repo and have staged changes
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "Not a git repo"; return 1; }
  git diff --cached --quiet && { echo "No staged changes. (Try: git add -p or git add -A)"; return 1; }

  local prompt msg
  prompt=$'Napiši kvalitetnu Git commit poruku na temelju staged diff-a ispod.\n\nVAŽNO: Commit poruka MORA biti napisana ISKLJUČIVO na hrvatskom jeziku.\n\nPravila:\n- Koristi Conventional Commits: feat|fix|refactor|docs|test|chore|build|ci|perf\n- Prvi red: imperativ, najviše 72 znaka\n- Opcionalno tijelo: prazan red, zatim najviše 3 bullet točke\n- Ispiši ISKLJUČIVO tekst commit poruke (bez navodnika, bez code fence-a)\n\nSTAGED DIFF:\n'  # codex exec supports reading the prompt from stdin by passing "-" as PROMPT
  # --sandbox read-only keeps it from doing anything destructive
  msg=$(
    { printf "%s" "$prompt"; git diff --cached; } | codex exec --sandbox read-only \
    -m gpt-5.1-codex-mini \
    -c model_reasoning_effort=low \
    -c model_verbosity=low \
    -
  )

  echo "---- suggested commit message ----"
  echo "$msg"
  echo "---------------------------------"

  local reply
  printf "Commit with this message and push? [Y/n] "
  IFS= read -r -k 1 reply
  echo

  case "$reply" in
    ""|$'\n'|y|Y) : ;;          # default YES on Enter
    n|N) echo "Aborted."; return 1 ;;
    *)  echo "Please answer y or n."; return 1 ;;
  esac

  printf "%s\n" "$msg" | git commit -F - || return 1
  git push
}

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/igbenic/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/igbenic/.npm/_npx/6913fdfd1ea7a741/node_modules/tabtab/.completions/electron-forge.zsh
alias home="ssh igbenic@homeserver.local"

alias configrepo='code "$HOME/Projects/config"'
alias configrepohome='cd "$HOME/Projects/config"'
alias configinstall='"$HOME/Projects/config/install.sh"'
alias zshconfig='code "$HOME/Projects/config/shell/.zshrc"'
alias hammerspoonconfig='code "$HOME/Projects/config/hammerspoon/init.lua"'

[[ -f "$HOME/Projects/config/codex/codex.zsh" ]] && source "$HOME/Projects/config/codex/codex.zsh"
[[ -f "$HOME/Projects/config/shell/.zshrc.local" ]] && source "$HOME/Projects/config/shell/.zshrc.local"

autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[cyan]%}${${(%):-%m}} %{$fg[yellow]%}%~ %{$reset_color%}%% "
