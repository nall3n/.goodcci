# ~/.zprofile
# $Id$

[[ -e "/etc/profile.env" ]] && source /etc/profile.env

umask 022

setopt ALL_EXPORT
if [ "$EUID" = "0" ] || [ "$USER" = "root" ] ; then
                PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${ROOTPATH}"
                PROMPT=$'%{\e[31;1m%}%n%{\e[m%}%{\e[32;1m%}@%5m%{\e[m%} %{\e[33;1m%}%y%{\e[m%} %{\e[31;1m%}%~%{\e[m%}\n%1(j:%{\e[33;1m%}:%{\e[32;1m%})[%j]%{\e[m%} %{\e[33;1m%}%T%{\e[m%} %{\e[31;1m%}%# %{\e[m%}'
else
                PATH="/usr/local/bin:/usr/bin:/bin:${PATH}"
                PROMPT=$'%{\e[32;1m%}%n@%5m%{\e[m%} %{\e[33;1m%}%y%{\e[m%} %{\e[31;1m%}%~%{\e[m%}\n%1(j:%{\e[33;1m%}:%{\e[32;1m%})[%j]%{\e[m%} %{\e[33;1m%}%T%{\e[m%} %{\e[31m%}%# %{\e[m%}'
fi

if [[ -d ~/bin ]] ; then
                PATH="${HOME}/bin:${PATH}"
                if [[ -d ~/sbin ]] ; then
                                PATH="${HOME}/sbin:${PATH}"
                fi
                if [[ -d ~/man ]] ; then
                                MANPATH="${HOME}/man:${MANPATH}"
                fi
                if [[ -d ~/share/man ]] ; then
                                MANPATH="${HOME}/share/man:${MANPATH}"
                fi
fi
if [[ -d /opt/local/bin ]] ; then
                PATH="/opt/local/bin:${PATH}"
                if [[ -d /opt/local/sbin ]] ; then
                                PATH="/opt/local/sbin:${PATH}"
                fi
                if [[ -d /opt/local/man ]] ; then
                                MANPATH="/opt/local/man:${MANPATH}"
                fi
fi

RPROMPT=$'%{\e[31m%}%# %{\e[m%}%{\e[33;1m%}%D{%a %d %b %G}%{\e[m%} %0(?:%{\e[32;1m%}:%{\e[31m%})[%?]%{\e[m%}'
HISTSIZE=4096
HISTFILE=~/.zsh_history
SAVEHIST=3072
EDITOR="vim"

LC_CTYPE="sv_SE.UTF-8"
LC_NUMERIC="sv_SE.UTF-8"
LC_TIME="sv_SE.UTF-8"
# . ignoreras vid sortering av tex lsoutput
#LC_COLLATE="en_US.UTF-8"
LC_MONETARY="sv_SE.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="sv_SE.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="sv_SE.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"

HAVE_RUN_ZPROFILE=Y

unsetopt ALL_EXPORT

unset MAILCHECK
unset ROOTPATH

if [ "$HAVE_RUN_LOCAL_ZPROFILE" != "Y" ] && [[ -f ~/.zprofile.local ]]; then
  . ~/.zprofile.local
  export HAVE_RUN_LOCAL_ZPROFILE="Y"
fi
~                              
