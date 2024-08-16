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
elseif (($+commands[nvim])); then
    alias vim=nvim
fi

# Use hub command if available
if (($+commands[hub])); then
    alias git=hub
fi

# Make ls better by default
alias ls="ls -alhG --color"
