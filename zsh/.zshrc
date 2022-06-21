# ~/.zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path
path=(
    "$HOME/bin"
    $path
    "/usr/local/bin"
    "/usr/local/sbin"
    "$HOME/go/bin"
    "$HOME/.local/bin"
    "$HOME/.krew/bin"
    "$HOME/.rvm/bin"
)

plugins=(
    git
    terraform
    brew
    docker
    zsh_reload
    kubectl
    ssh-agent
    1password
)


# Set up antigen
source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

# Load plugins
antigen bundle autojump
antigen bundle aws
antigen bundle direnv
antigen bundle docker
antigen bundle fzf

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Theme
# antigen theme ~/.zsh/themes/mh
antigen theme romkatv/powerlevel10k

antigen apply

# Add local completions
fpath=($fpath ~/.zsh/completions)

# Additional config files
. ~/.zsh/conf.d/aliases.zsh
. ~/.zsh/conf.d/appsettings.zsh
. ~/.zsh/conf.d/colors.zsh
. ~/.zsh/conf.d/functions.zsh
. ~/.zsh/conf.d/kubectl.zsh

if [ -d ~/.zsh/toolsettings ]; then
    for i in ~/.zsh/toolsettings/*; do
        source $i
    done
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Withokta
if [ -f "/Users/duncan.miller/.okta/okta-aws" ]; then
    . "/Users/duncan.miller/.okta/okta-aws"
fi

