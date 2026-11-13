alias gau='git add -u'
alias gcb='git checkout -b '
alias gcm='git checkout master'
alias gla='git checkout -'
alias gco='git checkout'
alias gcne='git commit --amend --no-edit'
alias gme='git commit -m '
alias gd='git diff'
alias gls='git log --graph --decorate'
alias gpu='git push'
alias gpl='git pull'
alias gs='git status'
alias gdr='git diff "origin/$(git rev-parse --abbrev-ref HEAD)"'

alias dh='du -hs *'

gmd() {
  # Extract branch name
  local branch=$(git rev-parse --abbrev-ref HEAD)
  
  # Extract ticket pattern from the branch name
  local ticket=$(echo "$branch" | grep -oE '^[A-Za-z]+-[0-9]+')

  # Ensure a ticket number is found
  if [[ -n "$ticket" ]]; then
    git commit -m "$ticket: $*"
    echo "Committed with massage:"
    echo "$ticket: $*"
  else
    echo "❌ No ticket number found in branch name."
  fi
}


alias cl='claude --model opus'
alias cls='claude --model sonnet'


