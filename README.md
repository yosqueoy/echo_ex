# Extended Echo - Bash Logging Utility
*echo_ex* command generates well-formed log messages with timestamp and log level.
```bash
$ echo_ex --level error "An unexpected error occurred."
2016-02-06 00:10:51 HKT [ERROR] An unexpected error occurred.
```
line-number flag adds the line number of the caller script.
```bash
$ echo_ex --line-number "This is a log message."
2016-02-06 00:04:51 HKT [INFO] test/main.sh:17 This is a log message.
```
You can customize the date format by date-format option.
```bash
$ echo_ex --date-format "%c" "Date format is set to %c."
Sat 06 Feb 2016 12:04:51 AM HKT [INFO] Date format is set to %c.
```
The command can be used in pipelines.
```bash
$ echo "piping test" | echo_ex
2016-02-06 00:23:30 HKT [INFO] piping test
```
# Usage
Source echo_ex.sh in your bash script.
```bash
source echo_ex.sh
# or
. echo_ex.sh
```

### echo_ex [OPTIONS] [STRING]
#### -l (or --level) LEVEL
  LEVEL is one of the following strings: info, warn, error. The default value is info.

#### -d (or --date-format) FORMAT
  FORMAT is GNU date format e.g. '%YY-%mm-%dd'. The default value is '%F %T %Z'.   

#### -n (or --line-number)
  Show caller's file name and line number e.g. main.sh:33.

