zstyle ":completion:*:commands" rehash 1
autoload -Uz colors && colors
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi
source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
alias python='python3'
alias l='ls -a'
alias ll='ls -al'
alias m='mise run'

git_prompt() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
    PROMPT="%F{034}%n%f:%F{020}%~%f $(git_super_status)"$'\n'"%# "
  else
    PROMPT="%F{034}%n%f:%F{020}%~%f "$'\n'"%# "
  fi
}

precmd() {
  git_prompt
}
source $HOME/.cargo/env

. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# pnpm
export PNPM_HOME="/Users/takeshitadaichi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Antigravity
export PATH="/Users/takeshitadaichi/.antigravity/antigravity/bin:$PATH"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zellij setup --generate-auto-start zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS="--style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"
source <(fzf --zsh)
