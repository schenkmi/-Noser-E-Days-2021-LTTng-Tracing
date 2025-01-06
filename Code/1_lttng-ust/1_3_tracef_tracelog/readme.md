# LTTng-UST tracef & tracelog

Example of printf like tracing with liblttng-ust

quick show tracef_tracelog.c
give hint regarding linking -llttng-ust -ldl
explain traceme.sh
=> --loglevel=TRACE_WARNING

```
cd 1_lttng-ust/1_3_tracef_tracelog
make clean && make
./traceme.sh ./tracef_tracelog
```

Console output
```
[16:20:23.874525864] (+0.000001203) pasop-vm lttng_ust_tracelog:TRACE_WARNING: { cpu_id = 4 }, { vpid = 36611, vtid = 36611, procname = "tracef_tracelog" }, { line = 29, file = "tracef_tracelog.c", func = "fibonacci_tracelog", _msg_length = 49, msg = "calling fibonacci_tracelog TRACE_WARNING with i=3" }
[16:20:23.874527096] (+0.000001232) pasop-vm lttng_ust_tracelog:TRACE_ERR: { cpu_id = 4 }, { vpid = 36611, vtid = 36611, procname = "tracef_tracelog" }, { line = 31, file = "tracef_tracelog.c", func = "fibonacci_tracelog", _msg_length = 45, msg = "calling fibonacci_tracelog TRACE_ERR with i=3" }
[16:20:23.874528316] (+0.000001220) pasop-vm lttng_ust_tracelog:TRACE_WARNING: { cpu_id = 4 }, { vpid = 36611, vtid = 36611, procname = "tracef_tracelog" }, { line = 29, file = "tracef_tracelog.c", func = "fibonacci_tracelog", _msg_length = 49, msg = "calling fibonacci_tracelog TRACE_WARNING with i=2" }
[16:20:23.874529543] (+0.000001227) pasop-vm lttng_ust_tracelog:TRACE_ERR: { cpu_id = 4 }, { vpid = 36611, vtid = 36611, procname = "tracef_tracelog" }, { line = 31, file = "tracef_tracelog.c", func = "fibonacci_tracelog", _msg_length = 45, msg = "calling fibonacci_tracelog TRACE_ERR with i=2" }
```


