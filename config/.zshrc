###################
#   zsh config    #
###################
eval "$(starship init zsh)"
if [ ! -d ~/.zsh ];then
  mkdir ~/.zsh
fi

if [ ! -d ~/.zsh/zsh-autosuggestions ];then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  clear
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ ! -d ~/.zsh/zsh-syntax-highlighting ];then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export HISTFILE=~/.zsh_history
export SAVEHIST=10000
export HISTSIZE=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

###################
#      asdf       #
###################
if [ ! -d ~/.asdf ];then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
fi

. $HOME/.asdf/asdf.sh


###################
#     aliases     #
###################
alias exa="exa --icons"
alias l="exa"
alias ll="exa -l"
alias la="exa -la"
alias rm="rm -r"

alias mpv="devour mpv"
alias zathura="devour zathura"
alias frun="devour flatpak run"


###################
# autocompletions #
###################
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit


###################
#  case-sensitive #
###################
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'


###################
#      paths      #
###################
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.bin"
