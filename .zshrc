# User specific enviroment
export TERM="xterm-256color"
export COLORTERM=truecolor
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Locale
export LC_ALL="en_US.UTF-8"

# tmux
export EDITOR="vim"

# autojump
source /usr/share/autojump/autojump.sh

# shellclash
alias clash="bash /etc/clash/clash.sh"
export clashdir="/etc/clash"

# proxy
export host_ip="127.0.0.1"
export ALL_PROXY="http://${host_ip}:7890" http_proxy="http://${host_ip}:7890" https_proxy="http://${host_ip}:7890"

# fzf
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --no-ignore-vcs --exclude '.git' --exclude '[Mm]iniconda3' --exclude '[Aa]naconda3' --color=always"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
FZF_PREVIEW_COMMAND="(bat --color=always {} || highlight -O ansi {} || cat {}) 2>/dev/null | head -100"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --ansi --preview='${FZF_PREVIEW_COMMAND}'"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#2e3440,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#2e3440,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
alias pp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# bat
export BAT_THEME="Nord"

# personal alias
alias ll='ls -alh'
alias la='ls -ah'

# nvim
alias vim='nvim'


# starship
function set_win_title(){
    echo -ne "\033]0;👻 $(echo $HOST)~$(echo $PWD) \007"
}
starship_precmd_user_func="set_win_title"
precmd_functions+=(set_win_title)



# Dev tools
# git
git config --global http.porxy "http://${host_ip}:7890"
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
# npm
npm config set registry http://registry.npm.taobao.org


# Utilities
# if [[ -f "${HOME}/.dotfiles/utilities.sh" ]]; then
# 	source "${HOME}/.dotfiles/utilities.sh"
# 	if pgrep ClashX &>/dev/null; then
# 		set_proxy 127.0.0.1
# 	fi
# fi


# zplug 插件
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# brew install zplug

source ~/.zplug/init.zsh

# zplug plugins
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "Aloxaf/fzf-tab"
zplug "plugins/colored-man-pages", from:"oh-my-zsh"
# 语法补全
zplug "zsh-users/zsh-completions"
# 历史搜索
zplug "zsh-users/zsh-history-substring-search"
# 自动建议
zplug "zsh-users/zsh-autosuggestions"
# 语法高亮
zplug "zdharma-continuum/fast-syntax-highlighting"
# enhanced ls / exa
# zplug "esc/conda-zsh-completion"
zplug "zpm-zsh/ls"
zplug "zpm-zsh/material-colors"
zplug "zpm-zsh/colorize"
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/Ubuntu", from:oh-my-zsh
zplug "plugins/command-not-found",   from:oh-my-zsh
zplug "plugins/vscode", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
# enhanced cd
# zplug "b4b4r07/enhancd", use:init.sh
# git
zplug "k4rthik/git-cal", as:command, frozen:1
# 解压
zplug 'plugins/extract', from:oh-my-zsh
# Load "emoji-cli" if "jq" is installed in this example
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi
zplug load

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# bindkey
# bindkey '\eOB'    history-substring-search-down
# bindkey "^[[1;5D" backward-word
# bindkey "^[[1;5C" forward-word
# bindkey  "^[[H"   beginning-of-line
# bindkey  "^[[F"   end-of-line

# fzf-type
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# tmux pop
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup


eval $(thefuck --alias)
eval "$(starship init zsh)"
