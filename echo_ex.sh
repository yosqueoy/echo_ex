#!/bin/bash
__echo_ex_usage() {
  echo "Usage: echo_ex [OPTIONS] [STRING]
  -l|--level LEVEL: (Optional) LEVEL is one of the following strings: info, warn, error. The default value is info.
  -d|--date-format FORMAT: (Optional) FORMAT is GNU date format e.g. '%YY-%mm-%dd'. The default value is '%F %T %Z'.   
  -n|--line-number: (Optional Flag) Show caller's file name and line number e.g. main.sh:33." >&2
}

__echo_ex_error() {
  echo -e "\e[31m$@\e[0m"
}

__echo_ex_warn() {
  echo -e "\e[33m$@\e[0m"
}

__echo_ex_info() {
  echo -e "$@"
}

echo_ex() {
  local dt level rest cmd line_number stdin date_format
  date_format='%F %T %Z'
  level="info"
  rest=()
  while [[ $# > 0 ]]; do
    local key="$1"
    case $key in
      -l|--level)
        level="$2"
        shift
        ;;
      -d|--date-format)
        date_format="$2"
        shift
        ;;
      -n|--line-number)
        if [[ ${BASH_SOURCE[1]} ]]; then 
          line_number="${BASH_SOURCE[1]}:${BASH_LINENO[0]}"
        fi
        ;;
      *)
        rest+=("$key")
        ;;
    esac
    shift
  done
  if [[ "$level" != "warn" ]] && [[ "$level" != "error" ]] && [[ "$level" != "info" ]]; then
    __echo_ex_usage
    return 1
  fi
  dt=$(date +"$date_format")
  cmd="__echo_ex_$level $dt [${level^^}]"${line_number:+" $line_number "}
  if [[ ${#rest[@]} > 0 ]]; then
    $cmd ${rest[@]}
  else
    read stdin
    $cmd $stdin
  fi
}
