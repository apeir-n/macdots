#!/usr/bin/env zsh

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
alias l="ls -CF"
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
alias russycheck="~/.local/scripts/snugglecheck.sh"
alias diaperchange="~/.local/scripts/diaperchange.sh"
alias wp='paper'
alias zz='nvim ~/.zshrc'
alias rz='source ~/.zshrc'
alias clock='CONF_PATH=$HOME/.config/clock-rs/conf.toml clock-rs'
alias toys='~/.local/scripts/toybox.sh'
alias life='game_of_life'
alias o="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault && y"
alias op="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault/__planner && y"
alias synco='obsidian_sync'
alias news='hackernews_tui'
alias pc='cd ~/.cache/wal && y'
alias colors='cat ~/.cache/wal/colors | pastel format'
alias scripts='cd ~/.local/scripts && y'
alias stars='astroterm -Cc -s 400 -a 41.1081 -o -81.5148'
alias stors='astroterm -Cuc -s 400 -a 41.1081 -o -81.5148'

#etc
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)
source "$XDG_DATA_HOME/ghcup/env"
eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"

if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    #NEWLINE=$'\n'
    #PROMPT="${NEWLINE}%K{1}%F{15} %D{%_I:%M%p} %K{3} %n %K{5} %~ %f%k ❯ "
    NL=$'\n'
    PROMPT="${NL}%F{9}%f%K{9}%F{0}%k%F{9}%f %F{10}%f%K{10}%F{0}%D{%I:%M%p}%k%F{10}%f %F{11}%f%K{11}%F{0}%~%k%F{11}%f ${NL}%F{13}%f%K{13}%F{0}%n%k%F{13}%f %F{8}❯%f "
else
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/bird.toml)"
fi

function c() {
    ${EDITOR:-nvim} "$HOME/.config/${(j:/:)@}"
}

function s() {
    ${EDITOR:-nvim} "$HOME/.local/scripts/${(j:/:)@}"
}

function note() {
    nvim "$HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Vault/'$1'.md"
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

