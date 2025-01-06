#!/bin/bash

RED=`tput setaf 1`
GREEN=`tput setaf 2`
NC=`tput sgr0`
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function usage()
{
    echo "Usage: "
    echo " "
    echo "`basename $0` [executable]"
    echo " "
    echo "Example: `basename $0` ./func-entry-exit"
}

function execute_with_log()
{
  echo "executing: ${RED}$1${NC}"
  $1
}

if [ -z "$1" ]; then
  usage
  exit 1
fi

echo " "

# create LTTng sesssion output to folder which contains the traceme.sh script
lttng create `basename $1` --output=$SCRIPTDIR

# add context userspace, vpid = virtual process ID, vtid = virtual thread ID, procname = process name
lttng add-context --userspace --type=vpid --type=vtid --type=procname

# enable dedicated userspace event 'lttng_ust_tracef:*'
lttng enable-event --userspace 'lttng_ust_tracef:*'

# enable dedicated userspace event 'lttng_ust_tracelog:*' with loglevel WARNING
lttng enable-event --userspace 'lttng_ust_tracelog:*' --loglevel=TRACE_WARNING

# enable dedicated userspace event 'lttng_ust_tracelog:*' with loglevel ERR
#lttng enable-event --userspace 'lttng_ust_tracelog:*' --loglevel=TRACE_ERR

# start the tracing    
lttng start

# execute the application
$1

# stop the tracing
lttng stop

# show what we traced
echo " "
lttng view
echo " "

# destroy the LTTng session
lttng destroy
