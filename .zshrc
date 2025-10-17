# --- AUTOCOMPLETION ---
autoload -U compinit
compinit

# --- HISTORY ---
setopt APPEND_HISTORY SHARE_HISTORY HIST_EXPIRE_DUPS_FIRST EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

# --- ARROW KEY HISTORY SEARCH ---
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# --- GENERAL ---
setopt NO_BEEP

# autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=249"

# syntax highlighting (enhanced)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

# --- PROMPT ---
export PS1="%n %~ ❯ "

# --- BUN ---
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# --- NVM ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# --- PNPM ---
export PNPM_HOME="$HOME/snap/code/208/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- ANDROID SDK ---
export ANDROID_SDK_ROOT=/usr/lib/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

# --- NODE_OPTIONS ---
export NODE_OPTIONS="--max-old-space-size=4096"

# --- ALIASES ---
alias ls='ls -1h'
alias lss='du -sh --apparent-size -- * | sort -h'

# --- LIGHTWEIGHT VISUAL ENHANCEMENTS ---
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias grep='grep --color=auto'

# --- FUNCTIONS ---
# mkcd: make directory and cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# fvw: fancy file view with syntax highlight and line gaps
fvw() {
  echo "\n"   # top gap
  if command -v batcat &>/dev/null; then
    batcat "$1"
  else
    cat "$1"
  fi
  echo "\n"   # bottom gap
}

# --- FIND SHORTCUTS WITH COMMON SKIP LIST ---
FIND_SKIP_DIRS=(-path "*/node_modules/*" -o -path "*/.*/*" -o -path "*/cache/*")

# find file by name, ignoring common skip dirs
findfile() {
  if [ -z "$1" ]; then
    echo "Usage: findfile <filename>"
    return 1
  fi
  find . -type f -name "$1" ! \( "${FIND_SKIP_DIRS[@]}" \)
}
alias findf='findfile'

# find directory by name, must start with /
finddir() {
  if [[ -z "$1" || "$1" != /* ]]; then
    echo "Usage: finddir /<directoryname>"
    return 1
  fi
  dir_name="${1#/}"   # remove leading /
  find . -type d -name "$dir_name" ! \( "${FIND_SKIP_DIRS[@]}" \)
}
alias findd='finddir'

# find all .env files, ignoring common skip dirs
findenv() {
  find . -type f -name ".env" ! -path "*/node_modules/*" ! -path "*/cache/*"
}

# Open new terminal in home directory
alias gt='gnome-terminal --working-directory=$HOME &'

# Open new terminal in current directory
alias gtdir='gnome-terminal'

# --- GIT: simple undo last push ---
gu() {
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Not a git."
    return 1
  fi

  echo "Undoing last commit (local+remote)"
  git reset --hard HEAD^ && git push origin +main
}
