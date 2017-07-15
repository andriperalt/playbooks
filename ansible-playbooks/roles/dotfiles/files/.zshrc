# Avoid the need to manually reset the terminal (https://wiki.archlinux.org/index.php/zsh#The_ttyctl_command)
ttyctl -f

# Source clone antigen
source ~/.config/antigen/antigen.zsh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# Configure and Load the theme
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_COLOR_SCHEME='light'
DEFAULT_USER=vashy
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_INSTALLATION_PATH="${ANTIGEN_BUNDLES}/bhilburn/powerlevel9k"
antigen theme bhilburn/powerlevel9k powerlevel9k

# Load configuration to Antigen
antigen apply
