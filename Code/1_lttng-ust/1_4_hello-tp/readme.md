# LTTng-UST Custom Trace Point

Example how to write own LTTng-UST trace points.

Definition of trace log: hello-tp.h
Implementation: hello-tp.c
Sample app: hello.c
give hint regarding linking -llttng-ust -ldl
explain traceme.sh

```
cd 1_lttng-ust/1_4_hello-tp
make clean && make
./traceme.sh "./hello noser engineering e-days"
```

Console output
```
[16:38:04.534782617] (+?.?????????) pasop-vm hello_world:my_first_tracepoint: { cpu_id = 4 }, { vpid = 37682, vtid = 37682, procname = "hello" }, { my_string_field = "hi there!", my_integer_field = 23 }
[16:38:04.534805872] (+0.000023255) pasop-vm hello_world:my_first_tracepoint: { cpu_id = 4 }, { vpid = 37682, vtid = 37682, procname = "hello" }, { my_string_field = "./hello", my_integer_field = 0 }
[16:38:04.534809607] (+0.000003735) pasop-vm hello_world:my_first_tracepoint: { cpu_id = 4 }, { vpid = 37682, vtid = 37682, procname = "hello" }, { my_string_field = "noser", my_integer_field = 1 }
[16:38:04.534812446] (+0.000002839) pasop-vm hello_world:my_first_tracepoint: { cpu_id = 4 }, { vpid = 37682, vtid = 37682, procname = "hello" }, { my_string_field = "engineering", my_integer_field = 2 }
[16:38:04.534815419] (+0.000002973) pasop-vm hello_world:my_first_tracepoint: { cpu_id = 4 }, { vpid = 37682, vtid = 37682, procname = "hello" }, { my_string_field = "e-days", my_integer_field = 3 }
[16:38:04.534910574] (+0.000095155) pasop-vm hello_world:my_first_tracepoint: { cpu_id = 4 }, { vpid = 37682, vtid = 37682, procname = "hello" }, { my_string_field = "x^2", my_integer_field = 16 }
```


