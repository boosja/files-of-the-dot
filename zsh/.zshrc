# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  fzf
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# fzf
export FZF_BASE=/usr/bin/fzf

# zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'

# User configuration
HISTFILE=~/.cache/zsh/.histfile
export ZSH_COMPDUMP=~/.cache/zsh/.zcompdump-$HOST

export TERMINAL=ghostty
export EDITOR=nvim
export BAT_THEME=base16

# From Omarchy
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ll=ls
# alias ll='LC_COLLATE=C.UTF8 ls -Al --group-directories-first --color=auto'

alias j='z'
alias lg='lazygit'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# fnm
FNM_PATH="/home/bsj/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/bsj/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
# fnm completions
eval "$(fnm env --use-on-cd --shell zsh)"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source /home/bsj/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
