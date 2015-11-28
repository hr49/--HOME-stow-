# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export NO_AT_BRIDGE=1

if [ -d "$HOME/install/title/bin" ]; then
    PATH="$HOME/install/title/bin:$PATH"
fi

export NVIM_TUI_ENABLE_TRUE_COLOR=1

if [ -d "$HOME/install/nvim/bin" ]; then
    PATH="$HOME/install/nvim/bin:$PATH"
fi

if [ -d "$HOME/install/apertium/lib" ]; then
    export LD_LIBRARY_PATH="$HOME/install/apertium/lib:${LD_LIBRARY_PATH}"
fi

if [ -d "$HOME/install/apertium/lib/pkgconfig" ]; then
    export PKG_CONFIG_PATH="$HOME/install/apertium/lib/pkgconfig:${PKG_CONFIG_PATH}"
fi
