alias backup='sudo "/home/matthew/bin/backup.sh"                              \
        "/media/matthew/My Passport/backup/$(hostname)"'
alias upgrade='sudo "/home/matthew/bin/upgrade.sh"'

alias tl='terminal-logger'
alias tlagq='tl apt-get --quiet --'
alias tlagqa='tl apt-get --quiet --autoremove --'
alias tlagqp='tl apt-get --quiet --purge --'

function gi {
        git init
        wget                                                                  \
                'https://www.gnu.org/licenses/gpl-3.0.txt'                    \
                --output-document COPYING
        git add COPYING
        git commit --message "Initial commit"
}

# 14:31:25 spectie | i alias 'xf' to xmllint --encode utf-8 --format -
# 14:31:45 spectie | it helps in reading matxin output
alias xeu8f='xmllint --encode utf-8 --format -'
