#!/bin/bash

if [ ! -d /tmp/lttng ]; then
  mkdir /tmp/lttng
fi

# snapshot use /tmp as it is in ram
lttng create sv-asb-benchmark --snapshot -o /tmp/lttng/sv-asb-latency-$(date +%s)

# two buffers, with a size of 32M and a read-timer of 0 seconds
lttng enable-channel --kernel kernel --num-subbuf 2 --subbuf-size=32M --read-timer 0

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

# user space channel, two buffers, with a size of 8M and a read-timer of 0 seconds
lttng enable-channel --userspace user --num-subbuf 2 --subbuf-size=8M --read-timer 0

# enable any user space event
lttng enable-event --userspace --channel=user --all

# actually start tracing
lttng start
