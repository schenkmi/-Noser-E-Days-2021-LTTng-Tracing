#!/bin/bash

if [ ! -d /tmp/lttng ]; then
  mkdir /tmp/lttng
fi

# use /tmp as it is in ram
lttng create -o /tmp/lttng/sv-asb-latency-$(date +%s)

# one buffer, with a size of 64M and a read-timer of 60 seconds
lttng enable-channel --kernel kernel --num-subbuf 1 --subbuf-size=64M --read-timer 60000000

# list of kernel events we like to record
kernel_events=(
  "sched_switch,sched_process_*"
  "irq_*" "signal_*" "workqueue_*"
)
for event in "${kernel_events[@]}"; do
  lttng enable-event --kernel --channel=kernel "$event"
done

# list of syscalls we like to record
sycall_events=(
  "mq_timedsend,mq_timedreceive"
  "getcpu"
  "epoll_wait"
)
for event in "${sycall_events[@]}"; do
  lttng enable-event --kernel --channel=kernel --syscall "$event"
done

# user space channel one buffer, with a size of 8M
lttng enable-channel --userspace user --num-subbuf 1 --subbuf-size 8M
# enable any user space event
lttng enable-event --userspace --channel=user --all

# actually start tracing
lttng start
