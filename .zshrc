# alias
# ls -> exa
# test
alias ll='ls -alh'
alias la='ls -ah'
# apt
alias apt='sudo apt-get'
alias allupdate='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove'
# fzf
alias pp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# vim
alias vim='nvim'
# tmux
EDITOR="vim"
# clash
alias clash="bash /etc/clash/clash.sh"
export clashdir="/etc/clash"

# bindkey 需要调整
bindkey '\eOB'    history-substring-search-down
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# starship 修改窗口标题
function set_win_title(){
    echo -ne "\033]0;👻 $(echo $HOST)~$(echo $PWD) \007"
}
starship_precmd_user_func="set_win_title"
precmd_functions+=(set_win_title)

export BAT_THEME="Nord"
export COLORTERM=truecolor

# autojump
[[ -s /home/wh/.autojump/etc/profile.d/autojump.sh ]] && source /home/wh/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# proxy clash 开启mix模式 port 7890
# wsl
export host_ip=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
# linux
# export host_ip=127.0.0.1
export ALL_PROXY="http://$host_ip:7890" http_proxy="http://$host_ip:7890" https_proxy="http://$host_ip:7890"
git config --global http.porxy "http://$host_ip:7890"

# npm配置指向源
npm config set registry http://registry.npm.taobao.org


# zplug 插件
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# brew install zplug

source ~/.zplug/init.zsh
#source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh
# . ~/z/z.sh

# fzf 键绑定
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# History config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# zplug plugins
# zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# fzf-tab fzf补全
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
zplug "zpm-zsh/ls"
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/Ubuntu", from:oh-my-zsh
# zplug "plugins/web-search",   from:oh-my-zsh
zplug "plugins/command-not-found",   from:oh-my-zsh
zplug "plugins/vscode", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
# zplug "plugins/composer", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh

# enhanced cd
zplug "b4b4r07/enhancd", use:init.sh

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
# zplug "Aloxaf/fzf-tab"

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

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda3/bin/condaL' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

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

eval $(thefuck --alias)
