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

alias withokta-picker="withokta \$(cat ~/.okta/.config/profiles  | grep '\[.*\]' | grep -v DEFAULT | sed 's/\[//g' | sed 's/\]//g' | fzf)" 
