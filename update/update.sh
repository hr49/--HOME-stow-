#!/bin/sh
logger.sh apt-get -q update
logger.sh apt-get -q dist-upgrade
logger.sh apt-get -q --purge autoremove
