# ftrace

https://opensource.com/article/21/7/linux-kernel-ftrace

FTrace events are located under `/sys/kernel/debug/tracing/events`

## List all tracing events
```
sudo find /sys/kernel/debug/tracing/events -type d
```


## Example syscall with ftrace for ls

```
sudo -i
```

```
echo 40000 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/syscalls/sys_enter_openat/enable
echo 1 > /sys/kernel/debug/tracing/events/syscalls/sys_exit_openat/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
echo > /sys/kernel/debug/tracing/trace
```
```
ls
```
```
echo 0 > /sys/kernel/debug/tracing/tracing_on
echo 0 > /sys/kernel/debug/tracing/events/syscalls/sys_enter_openat/enable
echo 0 > /sys/kernel/debug/tracing/events/syscalls/sys_exit_openat/enable
cat /sys/kernel/debug/tracing/trace > /home/pasop/tmpFtraceLog.log
chmod 666 /home/pasop/tmpFtraceLog.log
```

## Function tracer

```
sudo -i
```
```
cat /sys/kernel/tracing/available_tracers
cat /sys/kernel/tracing/current_tracer
echo function > /sys/kernel/tracing/current_tracer
echo 1 > /sys/kernel/debug/tracing/tracing_on
cat /sys/kernel/tracing/trace | head -20
```
```
echo 0 > /sys/kernel/debug/tracing/tracing_on
echo nop > /sys/kernel/tracing/current_tracer
```

## Function graph
```
sudo -i
```
```
cat /sys/kernel/tracing/available_tracers
cat /sys/kernel/tracing/current_tracer
echo function_graph > /sys/kernel/tracing/current_tracer
echo 1 > /sys/kernel/debug/tracing/tracing_on
cat /sys/kernel/tracing/trace | head -20
```
```
echo 0 > /sys/kernel/debug/tracing/tracing_on
echo nop > /sys/kernel/tracing/current_tracer
```
