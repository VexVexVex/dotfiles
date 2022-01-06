# appsettings.plugin.zsh
# Miscellaneous application settings

# Homebrew
export HOMEBREW_AUTO_UPDATE_SECS=86400
# export HOMEBREW_NO_GITHUB_API=1
# export HOMEBREW_NO_AUTO_UPDATE=1

# MPD server
export MPD_HOST=officenoise.local

# AWS settings
export AWS_SDK_LOAD_CONFIG=1

# Default editor
# Lower down in the list is preferred editor
[[ -x "/usr/bin/vi" ]] && export EDITOR=/usr/bin/vi
[[ -x "/usr/bin/vim" ]] && export EDITOR=/usr/bin/vim
[[ -x "/usr/local/bin/vim" ]] && export EDITOR=/usr/local/bin/vim
[[ -x "/usr/local/bin/nvim" ]] && export EDITOR=/usr/local/bin/nvim
[[ -x "/usr/bin/nvim" ]] && export EDITOR=/usr/bin/nvim

# Go
if [[ $(arch) == 'arm64' ]]; then
    gimme 1.17.5
else
    gimme stable
fi
source ~/.gimme/envs/latest.env
export GOPATH=$HOME/go
export GOPRIVATE="github.com/ValiMail/*"

# Autoload github token
if [[ -f ~/.githubtoken ]]; then
    GITHUB_TOKEN=$(cat ~/.githubtoken)
    export GITHUB_TOKEN
fi

if [[ -f ~/.datadog_creds.sh ]]; then
    source ~/.datadog_creds.sh
fi

# ZSH autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_HISORY_IGNOTRE="cd *"
# Make pasting fast with ZSH autosuggestions
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# History behavior
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
# This shouldn't be set if SHARE_HISTORY is set
unsetopt INC_APPEND_HISTORY

# Use rbenv if it exists
if command -v rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

# Minikube
if [[ -f /usr/local/bin/minikube ]]; then
    if minikube status > /dev/null 2>&1; then
        eval $(minikube docker-env)
    else
        minikube start &
        eval $(minikube docker-env)
    fi
fi
