 # Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.


# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return

# 'cd' && 'ls' by just typing out the cd command
cd() { builtin cd "$@" && ls --color; }
  
# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin $path)

# Expeort VScode path.
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Export environment variables.
export GPG_TTY=$TTY

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin

# Define key bindings.
z4h bindkey undo Ctrl+/   Shift+Tab  # undo the last command line change
z4h bindkey redo Option+/            # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Tab complete
autoload -U compinit; compinit

autoload -Uz zmv
#Command completion
autoload -U compinit
compinit
# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
alias hist="history 600"
alias ls="${aliases[ls]:-ls} -A"
alias zshrc="vim ~/.zshrc"
alias vim="nvim"
alias vimrc="vim ~/.config/nvim/lua/ryan/plugins-setup.lua"
alias udemy="cd ~/Docs/Udemy_Python"
alias learn="cd ~/Docs/Learning"
alias jup="jupyter notebook"
alias py="python3"
alias pip3="pip3.10"
alias hist="history 10"
alias env="source env/bin/activate"
alias modules="vim /Library/Frameworks/Python.framework/Versions/3.10/lib/python3.10/site-packages"
alias folio="cd ~/Docs/Work/Dev_Portfolio/portfolio/blessdog.github.io/"
alias algos="cd ~/Docs/Learning/DSA/kata-machine/src/day1"
alias dsa="cd ~/Docs/Learning/DSA/AlgoExpert/"
alias easy="cd ~/Docs/Learning/DSA/AlgoExpert/easy"
alias luarc="cd ~/.config/nvim/lua/"
alias resu="cd ~/Docs/Work/Resumes/"
alias proj="cd ~/Docs/Projects/"
alias chat="cd ~/Docs/Projects/ChatApp/"
alias openai="cd ~/Docs/Projects/ai/OpenAI_Course_Code/"
alias reac="cd /Users/SSDrive/React-Course/ultimate-react-course"


# zoxide is a smarter cd command, inspired by z and autojump.
# It remembers which directories you use most frequently, so you can "jump" to them in just a few keystrokes.
eval "$(zoxide init zsh)"

#Tmux 
#tput cup "$LINES"


# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export ASSEMBLY_AI_KEY="0c7cff2642a74ebf821992fc29337182"
########### EOF *************************
#****************************************
