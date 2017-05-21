#!/bin/bash
terminal-logger apt-get -q update
terminal-logger apt-get -q dist-upgrade
terminal-logger apt-get -q --purge autoremove
