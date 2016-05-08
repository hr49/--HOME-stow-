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

for d in title nvim apertium voikko; do
    d="$HOME/install/$d/bin"

    if [ -d "$d" ]; then
        PATH="$d:$PATH"
    fi
done

for LD_LIBRARY_d in apertium voikko; do
    LD_LIBRARY_d="$HOME/install/$LD_LIBRARY_d/lib"

    if [ -d "$LD_LIBRARY_d" ]; then
        LD_LIBRARY_PATH="$LD_LIBRARY_d:$LD_LIBRARY_PATH"
    fi
done

export LD_LIBRARY_PATH

for PKG_CONFIG_d in apertium voikko; do
    PKG_CONFIG_d="$HOME/install/$PKG_CONFIG_d/lib/pkgconfig"

    if [ -d "$PKG_CONFIG_d" ]; then
        export PKG_CONFIG_PATH="$PKG_CONFIG_d:$PKG_CONFIG_PATH"
    fi
done

export PKG_CONFIG_PATH

export NO_AT_BRIDGE=1
export NVIM_TUI_ENABLE_TRUE_COLOR=1
