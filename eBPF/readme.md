# eBPF (enhanced Berkeley Packet Filter)

https://www.brendangregg.com/BPF/bpftrace-cheat-sheet.html
https://de.slideshare.net/brendangregg/bpf-tracing-and-more

## bpftrace the eBPF tracing language & frontend

### Install
```
sudo apt install bpftrace
```

https://github.com/iovisor/bpftrace/blob/master/docs/tutorial_one_liners.md

### One-liners tutorial
From https://opensource.com/article/19/8/introduction-bpftrace

#### Listing probes
```
sudo bpftrace -l 'tracepoint:syscalls:sys_enter_*'
```

####Hello world
```
sudo bpftrace -e 'BEGIN { printf("Hello BPF!\n"); exit(); }'
```

####File opens
```
sudo bpftrace -e 'tracepoint:syscalls:sys_enter_open { printf("%s %s\n", comm, str(args->filename)) }'
sudo bpftrace -e 'tracepoint:syscalls:sys_enter_openat { printf("%s %s\n", comm, str(args->filename)) }'
```

####Syscall counts by process
```
sudo bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count() }'
```

####Distribution of read() bytes
```
sudo bpftrace -e 'tracepoint:syscalls:sys_exit_read /pid == 18644/ { @bytes = hist(args->retval) }'
```

####Kernel dynamic tracing of read() bytes
```
sudo bpftrace -e 'kretprobe:vfs_read { @bytes = lhist(retval, 0, 2000, 200) }'
```

####Timing read()s
```
sudo bpftrace -e 'kprobe:vfs_read { @start[tid] = nsecs } kretprobe:vfs_read /@start[tid]/ { @ns[comm] = hist(nsecs - @start[tid]); delete(@start[tid]) }'
```

####Count process-level events
```
sudo bpftrace -e 'tracepoint:sched:sched* { @[name] = count() } interval:s:5 { exit() }'
```

####Profile on-CPU kernel stacks
```
sudo bpftrace -e 'profile:hz:99 { @[stack] = count() }'
```

####Scheduler tracing
```
sudo bpftrace -e 'tracepoint:sched:sched_switch { @[stack] = count() }'
```

####Block I/O tracing
```
sudo bpftrace -e 'tracepoint:block:block_rq_issue { @ = hist(args->bytes); }
```

####Kernel struct tracing (a script, not a one-liner)
Command: `sudo bpftrace path.bt`, where the path.bt file is:
```
#include <linux/path.h>
#include <linux/dcache.h>

kprobe:vfs_open { printf("open path: %s\n", str(((path *)arg0)->dentry->d_name.name)); }
```
