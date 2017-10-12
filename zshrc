## zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "laurenkt/zsh-vimto"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "themes/ys", from:oh-my-zsh

zplug load #--verbose

## path
export PATH="/Users/msalacain/bin:/usr/local/bin:/usr/local/sbin:$PATH"

## thefuck
eval $(thefuck --alias)

## substring search bindings
## bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

## aliases
source ~/gits/dotfiles/aliases

## iterm shell integration
source ~/.iterm2_shell_integration.`basename $SHELL`

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/msalacain/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# history
setopt append_history share_history histignorealldups
HISTFILE=~/.zsh_history
SAVEHIST=0
