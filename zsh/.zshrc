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
    "$HOME/.nimble/bin:$PATH"
    "/opt/nvim-linux64/bin"
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

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#[ -f "/Users/duncan/.ghcup/env" ] && source "/Users/duncan/.ghcup/env" # ghcup-env
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexbuko-miller/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alexbuko-miller/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexbuko-miller/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alexbuko-miller/google-cloud-sdk/completion.zsh.inc'; fi

# opam configuration
[[ ! -r /Users/alexbuko-miller/.opam/opam-init/init.zsh ]] || source /Users/alexbuko-miller/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "/Users/alexbuko-miller/.ghcup/env" ] && source "/Users/alexbuko-miller/.ghcup/env" # ghcup-env
