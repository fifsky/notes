# Path to your oh-my-zsh installation.
export ZSH=/Users/fifsky/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl composer docker docker-compose osx zsh-autosuggestions)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/go/bin:~/.composer/vendor/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export DEFAULT_USER="$(whoami)"
#忽略重复的命令
export HISTCONTROL=ignoredups
export NODE_PATH="/usr/local/lib/node_modules/"
source /usr/local/lib/z.sh

export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/dist
export NVM_DIR="/Users/fifsky/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -la'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

plugins+=(zsh-completions)
autoload -Uz compinit && compinit -i

#source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#PS1='$(kube_ps1)'$PS1

export APP_ENV="local"

export GOROOT=/usr/local/go
#export GOPATH=/Users/fifsky/go/
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
export GO1111MODULE=on
export GOPROXY=https://goproxy.cn,direct
export GOPRIVATE=git.verystar.cn
#export GOSUMDB=off

ungoproxy () {
    unset GOPROXY
    echo "GOPROXY OFF"
}

# set proxy
proxy () {
	export ALL_PROXY="socks5://127.0.0.1:1080"
	export HTTP_PROXY="socks5://127.0.0.1:1080"
	export HTTPS_PROXY="socks5://127.0.0.1:1080"
	export NO_PROXY="git.verystar.cn,172.17.0.0/16"
	echo "Proxy on private"
}
# unset proxy
unproxy () {
	unset ALL_PROXY
	unset HTTP_PROXY
	unset HTTPS_PROXY
	echo "Proxy off"
}

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# added by travis gem
[ -f /Users/fifsky/.travis/travis.sh ] && source /Users/fifsky/.travis/travis.sh

# pub dev config .env
dev () {
   scp /Users/fifsky/wwwroot/devconf/dev.env root@10.64.146.16:/home/wwwroot/devconf/.env
}

# change docker env
dockerenv () {
	if [ "$1" == "minikube" ]; then
		eval $(minikube docker-env)
		echo "Docker env changed to minikube"
	else
		eval $(docker-machine env -u)	
		echo "Docker env restore to local"	
	fi
}


alias drmi="docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi"
alias drmc="docker ps -qf status=exited | xargs docker rm"

export WEBPATH=~/wwwroot
export DOCKER_USERNAME=xudong.cai@verystar.cn
export DOCKER_PASSWORD=198996Cxd18
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export LC_ALL=en_US.UTF-8


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
