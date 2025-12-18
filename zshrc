#env
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="/Users/wisdmm/.local/bin:$PATH"
export PATH="/Applications/SuperCollider.app/Contents/MacOS:$PATH"
#export MANPAGER="less -R --use-color -Dd+M -Du+B -DP+G -Ds+C"
#export MANPATH="$HOME/.local/share/man${MANPATH:+:${MANPATH}}"
#export MANPAGER="nvim +Man!"

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
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias man="batman"
alias brewup="brew update && brew upgrade && brew cleanup"
alias zz="nvim ~/.zshrc"
alias rz="source ~/.zshrc"
alias clock="CONF_PATH=$HOME/.config/clock-rs/conf.toml clock-rs"
alias toys="~/.nursery/scripts/toybox.sh"
alias life="game_of_life"
alias o="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault && y"
alias op="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault/__planner && y"
alias news="hackernews_tui"
alias pc="cd ~/.cache/wal && y"
alias colors="cat ~/.cache/wal/colors | pastel format"
alias scripts="cd ~/.local/scripts && y"
alias wp="cd ~/Pictures/wallpapers && y"
alias stars="astroterm -Cc -s 400 -a 41.1081 -o -81.5148"
alias stors="astroterm -Cuc -s 400 -a 41.1081 -o -81.5148"
alias cr="cargo run"
alias ff="fastfetch"
alias dadda="~/.local/ai/SillyTavern-Launcher/launcher.sh"
alias baby="cd ~/.baby && y"
alias xini="nvim ~/.xinitrc"
alias xres="nvim ~/.Xresources"
alias beget="sudo make clean install && make clean"
alias suck="cd ~/.local/src/suckless && y"
alias src="cd ~/.local/src && y"
alias proj="cd ~/.local/projects && y"

#etc
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source <(fzf --zsh)
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

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/wisdmm/.lmstudio/bin"
# End of LM Studio CLI section

case "$TERM" in
    "st-256color")
        source "$HOME/.local/scripts/prompta"
        ;;
    "xterm-256color")
        source "$HOME/.local/scripts/prompti"
        ;;
    "xterm")
        local nl=$'\n'
        PROMPT="${nl}%K{1}%F{0} %D{%I:%M} %K{3} zsh %K{4} %n %K{5} %m %f%k${nl}%F{7}┌── %~${nl}└─%f "
        ;;
    *)
        eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/bird.toml)"
        ;;
esac
