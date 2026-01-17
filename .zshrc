## nvm config 2025-08-10
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

## 2025-11-15
# Auto-switch node version on cd (optional but nice)
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to default Node version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# === Plugins (lightweight, no OMZ) ===
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# === Prompt: Git + Time on Right ===
# Git status in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Format: branch | clean/dirty
zstyle ':vcs_info:git:*' formats ' %b' 
zstyle ':vcs_info:git:*' actionformats ' %b|%a'
zstyle ':vcs_info:*' enable git

# Check for untracked files
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if git status --porcelain 2>/dev/null | grep -q '^??'; then
    hook_com[staged]+='?'
  fi
}

# Prompt
PROMPT='%F{green}%n@%m%f %F{blue}%3~${vcs_info_msg_0_}%f %(!.#.$) '
RPROMPT='%F{240}%T%f'  # Time on the right

# Git status symbols
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{green}●%f'    # staged changes
zstyle ':vcs_info:git:*' unstagedstr '%F{yellow}●%f' # unstaged changes
zstyle ':vcs_info:git:*' formats ' %F{cyan}%b%f%u%c'
zstyle ':vcs_info:git:*' actionformats ' %F{red}%b%f|%a%u%c'

# === Misc ===
export EDITOR='code -w'  # VSCode as editor
# setopt autocd            # cd by typing dir name
setopt correct          # spelling correction
setopt histignorealldups

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Keep this as the last zsh plugin to source. ref: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md?plain=1#L90
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

