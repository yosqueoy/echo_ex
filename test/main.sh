#!/bin/bash 
cd $(dirname $0)
source ../echo_ex.sh
set -v
echo_ex "No option."
echo_ex -l info "Level is set to info."
echo_ex -l warn "Level is set to warn."
echo_ex -l error "Level is set to error."
echo_ex -l none "Level is set to none, which should generate the usage message."
echo_ex --level info "Level (long option) is set to info."
echo_ex --level warn "Level (long option) is set to warn."
echo_ex --level error "Level (long option) is set to error."
echo_ex --level none "Level (long option) is set to none, which should generate the usage message."
echo_ex -d "%c" "Date format is set to %c."
echo_ex --date-format "%c" "Date format (long option) is set to %c."
echo_ex -n "Line number is enabled. The line number should be main.sh:16."
echo_ex --line-number "Line number (long option) is enabled. The line number should be main.sh:17."
echo_ex -l error -d "%c" -n "All combined."
echo "piping test." | echo_ex -l error -d "%c" -n
