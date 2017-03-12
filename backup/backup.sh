#!/bin/sh
cd /media/matthew/My\ Passport
f="$(date +%Y%m%dT%H%M%S%z).tar.xz"
tar cv -X ~matthew/exclude_from ~matthew|xz -9 > "${f}"
