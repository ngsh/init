## kubectl auto complete {{{
# kubectl zsh autocompletion
## ref: https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-zsh/
autoload -Uz compinit
compinit
source <(kubectl completion zsh)
alias k=kubectl
compdef __start_kubectl k
## added by ngsh on Dec 1, 2021
## }}}

## zsh ps1 {{{
## tutorial https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
#PROMPT='%(?.%F{green}➤.%F{red}?%?)%f %~ '$'\n''%(!.#.>) '
#PROMPT='%B%F{24}%~%f%b'$'\n''%(!.#.>) '
PROMPT='%(?.%B%F{24} %~%f%b.%B%F{red}%~%f%b) '$'\n''%(!.#.>) '
RPROMPT='%t'
## }}}
## kube-ps1 {{{
  source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
  PROMPT='$(kube_ps1)'$PROMPT
  ## configure https://github.com/jonmosco/kube-ps1/
  KUBE_PS1_PREFIX='['
  KUBE_PS1_SYMBOL_DEFAULT='K8S'
  KUBE_PS1_SYMBOL_USE_IMG=false
  KUBE_PS1_SYMBOL_PADDING=false
  KUBE_PS1_SUFFIX=']'
  KUBE_PS1_BG_COLOR=''
  function get_cluster_short() {
    echo "$1" | cut -d / -f2
  }
  KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
  function get_namespace_upper() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
  }
  KUBE_PS1_NAMESPACE_FUNCTION=get_namespace_upper
  kubeoff
## }}}
## kubectx {{{
  ## configure https://github.com/ahmetb/kubectx
## }}}

## brew auto completion {{{
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
## }}}
