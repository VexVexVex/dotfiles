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

# Use nvim if available
if (($+commands[nvim])); then
    alias vim=nvim
fi

# Use hub command if available
if (($+commands[hub])); then
    alias git=hub
fi

# Make ls better by default
alias ls="ls -alhG"

alias gcp-infra="gcloud config set project invisible-infra"
alias gcp-tools="gcloud config set project invisible-tools"
alias gcp-stage="gcloud config set project invisible-stage"

alias k8s-stage="gcloud container clusters get-credentials stage-cluster --region us-west1 --project invisible-stage"
alias k8s-tools="gcloud container clusters get-credentials tools-cluster --region us-west1 --project invisible-tools"
alias k8s-prod="gcloud container clusters get-credentials invisible-prod-cluster  --region us-west1 --project invisible-infra"
