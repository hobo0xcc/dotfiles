# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hobo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="nicoulaj"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=2

path=(
  "/usr/bin"
  "/usr/local/opt/gcc/bin"
  "/usr/local/opt/bison/bin"
  "/usr/local/opt/llvm@7/bin"
  /Users/hobo/Develop/opt/emacs/Emacs.app/Contents/MacOS
  "/Users/hobo/.ghcup/bin"
  "/Users/hobo/Develop/opt/alda/bin/"
  "/Users/hobo/Develop/opt/grub/bin"
  "/Users/hobo/Develop/opt/yasm/bin"
  "/Users/hobo/Develop/opt/qemu/bin"
  "/Users/hobo/Develop/opt/pypy/pypy3.6-v7.2.0-osx64/bin"
  "/Applications/MIT:GNU Scheme 10.1.6.app/Contents/Resources"
  /Users/hobo/Develop/opt/make/bin
  /Users/hobo/.local/bin
  $HOME/.cargo/bin
  ~/Develop/oss/cquery/build
  ~/Develop/oss/emsdk/fastcomp/emscripten
  ~/Develop/opt/wabt/bin
  ~/Develop/opt/cross/bin
  ~/Develop/opt/x86_64-apple-darwin/bin
  "/Users/hobo/Develop/opt/zig/zig-macos-x86_64-0.4.0"
  /usr/local/opt/binutils/bin
  /usr/local/opt/gcc/bin
  /usr/local/opt/nasm/bin
  /usr/local/Cellar/ctags/5.8_1/bin
  /usr/local/Cellar/gcc/8.3.0
  $HOME/Develop/bin/premake5/
  $HOME/go/bin/
  $HOME/.cabal/bin:${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/binutils
  "/Users/hobo/Develop/playground/atcoder/lib/"
  $path
)

# export LLDB_DEBUGSERVER_PATH="/usr/local/opt/llvm@8/bin/lldb-server"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
alias objdump='x86_64-apple-darwin-objdump'
alias emacs='emacs -nw'
alias ar='/usr/bin/ar'
alias ranlib='/usr/bin/ranlib'
alias ls='ls -G -p'
alias atcoder='cd ~/Develop/playground/atcoder/'

# alias gcc='gcc-8'
# export PATH="/usr/bin/:$PATH"
# export PATH="/Users/hobo/.local/bin:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/Develop/oss/cquery/build:$PATH"
# export PATH="/usr/local/opt/binutils/bin:$PATH"
# export PATH="/usr/local/Cellar/ctags/5.8_1/bin:$PATH"
# export PATH="/usr/local/Cellar/gcc/8.3.0:$PATH"
# export PATH="$HOME/Develop/bin/premake5/:$PATH"
# export PATH="$HOME/go/bin/:$PATH"
# export PATH="$HOME/.cabal/bin:${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/bin:$PATH"

