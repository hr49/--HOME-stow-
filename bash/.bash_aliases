BACKUP_DEVICE_NAME='My Passport'
alias backup="backup /media/$(whoami)/$BACKUP_DEVICE_NAME/backup/$(hostname)"

gi() {
        git init
        wget                                                                  \
                'https://www.gnu.org/licenses/gpl-3.0.txt'                    \
                -O COPYING
        git add COPYING
        git commit -m                                                         \
                "Initial commit"
}

# <https://stackoverflow.com/a/5528045>
encode() {
        local _stdin="$(cat)"
        for (( i = 0; i < ${#_stdin}; ++i ))
        do printf '<U%04X>' "'${_stdin:i:1}"
        done
}

# 14:31:25 spectie | i alias 'xf' to xmllint --encode utf-8 --format -
# 14:31:45 spectie | it helps in reading matxin output
alias gq='xmllint --encode utf-8 --format -'
