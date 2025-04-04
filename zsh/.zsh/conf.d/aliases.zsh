# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias lS='ls -1FSsh'  #List of files and directories sorted in decreasing order of size. Dirs will be 0
alias lart='ls -1Fcart' #List of files and directories newest first and all hidden files too
alias lrt='ls -1Fcrt' #List of files and directories sorted newest first
alias lsr='ls -lARFh' #Recursive list of files and directories be careful where you use this
alias lsn='ls -1'     #Outputs a list of files and directories columnar style

alias ez='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' #Quick edit .zshrc file
alias ea='${=EDITOR} ${ZDOTDIR:-$HOME}/.zsh/conf.d/aliases.zsh' #Quick edit aliases

alias sdig='dig +short'
alias mdig='dig @224.0.0.251 -p 5353 +time=1 +tries=1' #mDNS dig

#default to nerdctl if you have it
if (($+commands[nerdctl])); then
  alias docker="nerdctl "
fi

alias runningcontainers="docker ps --format '{{.Image}}\\t{{.Names}}"

alias grep='grep --color' #Grep but with colors
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} ' #Recursive, with line numbers, filename headers, 5 lines of context, don't do VCS

alias t='tail -f' #Read end of file

# Command line head / tail shortcuts, -g means it's useable anywhere in a command
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h' #disk usage go one dir deep, human readable
alias ff='find . -type f -name' #find file by name

alias h='history' #See command history
alias hgrep="fc -El 0 | grep" #Search command history
alias help='man' #If you just cannot remember
alias p='ps -f' #UID, PID, PPID, CPU usage etc
alias sortnr='sort -n -r' #numeric and in reverse
alias unexport='unset'

# default opener in cli for extensions. can just type filename and will open with it
# we all should have 4.2.0 at least but just in case
autoload -Uz is-at-least
if is-at-least 4.2.0; then
  if [[ -n "$BROWSER" ]]; then
    _browser_fts=(htm html de org net com at cx nl se dk)
    for ft in $_browser_fts; do alias -s $ft='$BROWSER'; done
  fi

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts; do alias -s $ft='$EDITOR'; done

  if [[ -n "$XIVIEWER" ]]; then
    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts; do alias -s $ft='$XIVIEWER'; done
  fi

  _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts; do alias -s $ft=mplayer; done

    #read documents
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


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
