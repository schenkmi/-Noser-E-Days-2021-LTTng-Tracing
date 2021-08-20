# LTTng-UST Dynamic Tracing with dtrace

Example how to trace DTRACE_PROBE with LTTng

What is an SDT Probe?
Statically Defined Tracing Probe
Data gathering at specific points in the code
Implemented by DTRACE_PROBE* macros in <sys/sdt.h>
When the probe is not enabled, there are a sequence of “nops” in the binary,
making for minimal impact.

quick show tracef_tracelog.c
give hint regarding linking -llttng-ust -ldl
explain traceme.sh

Example create UST trace for every call to malloc
```
lttng enable-event --kernel \
--userspace-probe /lib/x86_64-linux-gnu/libc.so.6:malloc \
my_libc_malloc_probe
```

```
cd 2_dynamic-dtrace
make clean && make
./traceme.sh ./dynamic-dtrace
```

Console output
```
Displaying notes found in: .note.gnu.property
Owner                Data size 	Description
GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
Properties: x86 feature: IBT, SHSTK

Displaying notes found in: .note.gnu.build-id
Owner                Data size 	Description
GNU                  0x00000014	NT_GNU_BUILD_ID (unique build ID bitstring)
Build ID: 3b5a4f76e04033565bbbfb067d5845e16aedaad9

Displaying notes found in: .note.ABI-tag
Owner                Data size 	Description
GNU                  0x00000010	NT_GNU_ABI_TAG (ABI version tag)
OS: Linux, ABI: 3.2.0

Displaying notes found in: .note.stapsdt
Owner                Data size 	Description
stapsdt              0x0000002e	NT_STAPSDT (SystemTap probe descriptors)
Provider: my_provider
Name: my_probe
Location: 0x0000000000001144, Base: 0x0000000000002004, Semaphore: 0x0000000000000000
Arguments:


Session dynamic-dtrace created.
Traces will be output to /work/Noser-E-Days-2021-LTTng-Tracing/Code/lttng/2_dynamic-dtrace
UST context vpid added to all channels
UST context vtid added to all channels
UST context procname added to all channels
Kernel event my_probe_cal created in channel channel0
Tracing started for session dynamic-dtrace
Waiting for data availability.
Tracing stopped for session dynamic-dtrace

Trace directory: /work/Noser-E-Days-2021-LTTng-Tracing/Code/lttng/2_dynamic-dtrace

[16:46:30.689229272] (+?.?????????) pasop-vm my_probe_cal: { cpu_id = 4 }, { ip = 0x5652DC105144 }

Destroying session dynamic-dtrace..
Session dynamic-dtrace destroyed
```