#env
export HATE="camelCase"
export LOVE="snake_case"

#hist
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

#zshbasic
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump-${ZSH_VERSION}"
mkdir -p "${ZSH_COMPDUMP:h}"
autoload -Uz compinit && compinit
autoload -Uz tetriscurses
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line
bindkey -v
bindkey '^[[A' history-beginning-search-backward  # Up arrow
bindkey '^[[B' history-beginning-search-forward   # Down arrow
bindkey '^L' autosuggest-accept

#alias
alias ls="eza --icons --group-directories-first --color=auto --oneline --all"
alias ll="ls -lah"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias man="batman"
alias brewup="brew update && brew upgrade && brew cleanup"
alias zz="${EDITOR} $HOME/.zshrc"
alias ze="${EDITOR} $HOME/.zshenv"
alias rz="source $HOME/.zshrc"
alias clock="CONF_PATH=$HOME/.config/clock-rs/conf.toml clock-rs"
alias news="hackernews_tui"
alias colors="cat $HOME/.cache/wal/colors | pastel format"
alias stars="astroterm -Cc -s 400 -a 41.1081 -o -81.5148"
alias stors="astroterm -Cuc -s 400 -a 41.1081 -o -81.5148"
alias cr="cargo run -q"
alias ff="fastfetch"
alias dadda="$HOME/.local/ai/SillyTavern-Launcher/launcher.sh"
alias xini="nvim $HOME/.xinitrc"
alias xres="nvim $HOME/.Xresources"
alias beget="sudo make clean install && make clean"
alias pa="ping apple.com"
alias pkglist="brew list --installed-on-request"
alias paper="$HOME/.local/bin/paper"

alias o="cd $VAULT && y"
alias op="cd $VAULT/planner && y"
alias wp="cd $HOME/Pictures/wallpapers && y"
alias scripts="cd $HOME/.local/scripts && y"
alias pc="cd $HOME/.cache/wal && y"
alias baby="cd $HOME/.baby && y"
alias suck="cd $HOME/.local/src/suckless && y"
alias src="cd $HOME/.local/src && y"
alias code="cd $HOME/code && y"
alias comfy="cd $HOME/.local/ai/ComfyUI/output && y"
alias dl="cd $HOME/Downloads && y"
alias sdk="cd /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk && y"

#etc
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$XDG_DATA_HOME/ghcup/env"
eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"

function c() {
    ${EDITOR:-nvim} "$HOME/.config/${(j:/:)@}"
}

function s() {
    ${EDITOR:-nvim} "$HOME/.local/scripts/${(j:/:)@}"
}

function v() {
    ${EDITOR:-nvim} "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault/${(j:/:)@}.md"
}

function hc() {
    hx "$HOME/.config/${(j:/:)@}"
}

function hs() {
    hx "$HOME/.local/scripts/${(j:/:)@}"
}

function hv() {
    hx "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault/${(j:/:)@}.md"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
ZSH_HIGHLIGHT_STYLES[default]="fg=white"
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=white"
ZSH_HIGHLIGHT_STYLES[command]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[precommand]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[function]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[path]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[cursor]="fg=blue"
ZSH_HIGHLIGHT_STYLES[bracket-level-1]="fg=green"
ZSH_HIGHLIGHT_STYLES[bracket-level-2]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[bracket-level-3]="fg=blue"
ZSH_HIGHLIGHT_STYLES[bracket-level-4]="fg=magenta"

case "$TERM" in
    "st-256color")      # simple term
        source "$HOME/.local/scripts/prompta"
        ;;
    "xterm-256color")   # apple term
        source "$HOME/.local/scripts/prompti"
        ;;
    "xterm")            # actual xterm
        local nl=$'\n'
        PROMPT="${nl}%K{1}%F{0} %D{%I:%M} %K{3} zsh %K{4} %n %K{5} %m %f%k${nl}%F{7}┌── %~${nl}└─%f "
        ;;
    *)                  # ghostty etc
        eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/bird.toml)"
        ;;
esac
