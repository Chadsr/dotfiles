#################################
# General Environment Variables #
#################################

# Set default editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# Add any local binaries to PATH
export PATH=$PATH:$HOME/.local/bin

# Anaconda
export PATH=$PATH:/opt/anaconda/bin

# Android
export PATH=$PATH:/opt/android-sdk/platform-tools
export PATH=$PATH:/opt/android-sdk/emulator

################################
# Golang Environment Variables #
################################
export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Enable Go modules by default
export GO111MODULE=on

############
# Electron #
############

# Fixes moving files to trash in electron apps
export ELECTRON_TRASH=gio

##############################
# Ruby Environment Variables #
##############################

export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GEM_HOME/ruby/2.6.0/bin

#################################
# Node.js Environment Variables #
#################################

NPM_PACKAGES="${HOME}/.npm-packages:${HOME}/.nvm/versions/node/v10.19.0/bin"
export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MAN_PATH=$(manpath)
export MANPATH="$NPM_PACKAGES/share/man:${MAN_PATH}"

NODE_PATH=$(npm root -g)
export NODE_PATH=${NODE_PATH}

#################
# Gnome Keyring #
#################

# Start the Gnome Keyring Daemon for headless zsh sessions
if [ -n "$DESKTOP_SESSION" ]; then
    eval "$(gnome-keyring-daemon --start --components=secrets,pkcs11)"
fi

#################
#  GPG for SSH  #
#################
TTY=$(tty)
export GPG_TTY=${TTY}

GPGCONF=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK=${GPGCONF}
gpgconf --launch gpg-agent

#################
#  MPD Hackery  #
#################
if nmcli --mode tabular --terse --fields TYPE,NAME connection show --active | grep -q vpn:tun.ross.ch; then
    export MPD_HOST=10.19.49.5
else
    export MPD_HOST=nas.lan
fi

# If you have access to my LAN, congratulations, you're probably trusted enough to play with my local MPD server so here's the password
export MPD_PASS=GimmeMusicPls

################
#    Other     #
################

# export _JAVA_AWT_WM_NONREPARENTING=1
source $HOME/.drone.env
