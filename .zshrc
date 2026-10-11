neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export GIT_REPOSITRIES=/home/wang/git-repositories

# Path to your oh-my-zsh installation.
export ZSH="/home/wang/.oh-my-zsh"
export TERM_FONT="MesloLGS NF"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# -------------------> ranger <-----------------------
# export RANGER_LOAD_DEFAULT_RC=FALSE

# 256颜色
[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 30

# 支持tab进行滚动补全
# zstyle ':completion:*' menu yes select 

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
plugins=(
	git
	gitfast
	vi-mode
	sudo
	colored-man-pages
	autojump
	web-search
	command-not-found
	safe-paste
	history
	
	# fzf-tab
	git-open
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
	incr
)

HIST_STAMPS="yyyy-mm-dd" 

source $ZSH/oh-my-zsh.sh

[[ -s /home/wang/.autojump/etc/profile.d/autojump.sh ]] && source /home/wang/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ra="ranger"
alias cat='batcat --color=always'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# vi-mode设置
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# 高亮风格
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# 未知/错误
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff0000'

# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

# To have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=#ee82ee'
# 路径划分符/
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#00bfff'

# 命令
ZSH_HIGHLIGHT_STYLES[command]='fg=#00ff00' # 用户安装
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7cfc00' # 系统内建
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#00fa9a'

# 单-字符选项
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ff1493'
# 双--字符选项
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ff69b4'

# 命令划分符&&等
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#fa8027'

# 通配符 
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#00ffff'

# 括号
# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=#7fffd4,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=#800080,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=#d02090,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=#caff70,bold'
ZSH_HIGHLIGHT_STYLES[bracket-matchingbracket]='fg=#00ff7f,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=#ff4500,bold'

# =============================> FZF <=====================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf默认命令
# --hidden搜索时包括隐藏文件,-E排除文件,其中. /home /etc设置默认任何目录下都可以搜索这些目录下的文件
# export FZF_DEFAULT_COMMAND='fd --hidden --follow -E ".git" -E "node_modules" . /home /etc'
export FZF_DEFAULT_COMMAND='fd --hidden --follow -E ".git" -E "node_modules"'
# --bind绑定快捷键
# --preview用于预览

# export FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview "echo {} | ~/linux-config-file/fzf/file_preview.py" --preview-window=down'
export FZF_DEFAULT_OPTS="
--height 80% 
--layout=reverse 
--border rounded 
--preview 'batcat --color=always --style=numbers,changes --line-range=:500 {}'
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
"

export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | batcat -p -lman'" 
# Use ~~ as the trigger sequence instead of the default **
# export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
	# fdfind --hidden --follow -E ".git" -E "node_modules" . $1 /home /etc
	fd --hidden --follow -E ".git" -E "node_modules" . "$1"
}

# Use fd to generate the list for directory completion
# 只找目录
_fzf_compgen_dir() {
	# fdfind --type d --hidden --follow -E ".git" -E "node_modules" . $1 /home /etc
	fd --type d --hidden --follow -E ".git" -E "node_modules" . "$1"
}

source /home/wang/.config/broot/launcher/bash/br
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
# ----------------------> tldr <-----------------------------------
export TLDR_COLOR_NAME="cyan"
export TLDR_COLOR_DESCRIPTION="white"
export TLDR_COLOR_EXAMPLE="green"
export TLDR_COLOR_COMMAND="red"
export TLDR_COLOR_PARAMETER="white"
export TLDR_LANGUAGE="es"
export TLDR_CACHE_ENABLED=1
export TLDR_CACHE_MAX_AGE=720
export TLDR_PAGES_SOURCE_LOCATION="https://raw.githubusercontent.com/tldr-pages/tldr/master/pages"
export TLDR_DOWNLOAD_CACHE_LOCATION="https://tldr-pages.github.io/assets/tldr.zip"

# ------------> lsd <----------------------
alias lsdal='lsd -al --date +%Y年%m月%d"日"%H:%M:%S'
alias ll='lsd -l --date +%Y年%m月%d"日"%H:%M:%S'

alias bd=". bd -si"

# -----------> java8 <----------------
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export JRE_HOME=${JAVA_HOME}/jre  
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
export PATH=${JAVA_HOME}/bin:$PATH  

# -----------> tomcat <--------------
CATALING_HOME=/opt/tomcat8

# ----------> maven <--------------
MAVEN_HOME=/home/wang/software-pkg/maven/apache-maven-3.6.3
export MAVEN_HOME=${MAVEN_HOME}
export PATH=${PATH}:${MAVEN_HOME}/bin


# Created by `pipx` on 2025-03-04 00:37:36
export PATH="$PATH:/home/wang/.local/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/llvm-19/lib"

function pretty_help() {
  local cmd="$1"
  shift
  "$cmd" --help | batcat -plhelp
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# >>> xmake >>>
test -f "/home/wang/.xmake/profile" && source "/home/wang/.xmake/profile"
# <<< xmake <<<
export __CXX_PRECOMPILE_MODULE_DIR__=~/.local/lib/cxxpcm

export VCPKG_ROOT=~/git-repositories/vcpkg
export PATH=$PATH:$VCPKG_ROOT
export VCPKG_OVERLAY_TRIPLETS=~/.vcpkg-triplets

no_proxy="localhost,127.0.0.1,::1"


export PATH=/opt/gcc-16/bin:$PATH
