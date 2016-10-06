#!/bin/bash

# Logger

etrace() {
    echo -e '\033[1;37m'$1'\033[0m'
}

edebug() {
    echo -e '\033[1;32m'$1'\033[0m'
}

einfo() {
    echo -e '\033[1;34m'$1'\033[0m'
}

ewarn() {
    echo -e '\033[0;33m'$1'\033[0m'
}
