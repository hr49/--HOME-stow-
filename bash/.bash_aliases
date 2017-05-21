BACKUP_DEVICE_NAME='My Passport'
alias backup="backup /media/$(whoami)/$BACKUP_DEVICE_NAME/backup/$(hostname)"

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
alias gq='xmllint --encode utf-8 --format -'
