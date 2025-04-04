# aliases.plugin.zsh

# Short dig alias
alias sdig='dig +short'

# mDNS dig
alias mdig='dig @224.0.0.251 -p 5353 +time=1 +tries=1'

# Perl timestamp alias
alias perlts='perl -p -e "s/^(\d+)/localtime(\$1)/e"'

# List running vms
alias runningcontainers="docker ps --format '{{.Image}}\\t{{.Names}}'"

# Saml2aws login alias
alias s2al='saml2aws login --skip-prompt'

# Use lvim/nvim if available
if (($+commands[lvim])); then
    alias vim=lvim
elif (($+commands[nvim])); then
    alias vim=nvim
fi

# Use hub command if available
if (($+commands[hub])); then
    alias git=hub
fi

# Make ls better by default
alias ls="ls -alhG --color"

alias k8s-prod="gcloud config set project invisible-infra && gcloud container clusters get-credentials invisible-prod-cluster --region us-west1"
alias k8s-stage="gcloud config set project invisible-stage && gcloud container clusters get-credentials stage-cluster --region us-west1"
alias k8s-tools="gcloud config set project invisible-tools && gcloud container clusters get-credentials tools-cluster --region us-west1"
alias k8s-internal="gcloud config set project invisible-tools && gcloud container clusters get-credentials internal-tooling-cluster --region us-west1"
