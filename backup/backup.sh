#!/bin/bash

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -eo pipefail
unalias -a

[[ "$EUID" -eq 0 ]] && [[ -n "$SUDO_USER" ]] || {
echo "$0: You must use sudo to execute this program as the superuser"
exit 1
}

##ARCHIVE="$1/$(date +%Y%m%dT%H%M%S%z).tar.xz"
#cd "$1"
#ARCHIVE="$(date +%Y%m%dT%H%M%S%z).tar.xz"  # "$1" may have a trailing "/".
exec 3> "${1%/}/$(date +'%Y%m%dT%H%M%S%z').tar.xz"

SUDO_HOME="$(getent passwd $SUDO_USER|cut -d: -f6)"
#tar cv -X "$SUDO_HOME/.backup/exclude-from" /etc "$SUDO_HOME"|xz -9 >&3
