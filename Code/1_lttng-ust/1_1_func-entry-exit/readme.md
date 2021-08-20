# LTTng-UST Function Entry/Exit

Simple example of function tracing by using preloading `liblttng-ust-cyg-profile.so`
don't forget to build with `--finstrument-functions`

quick show func-entry-exit.c
explain traceme.sh

```
cd 1_lttng-ust/1_1_func-entry-exit/
make clean && make
./traceme.sh ./func-entry-exit
```

Console output
```
[10:58:54.371911146] (+0.000000126) pasop-vm lttng_ust_cyg_profile:func_entry: { cpu_id = 2 }, { vpid = 12179, vtid = 12179, procname = "func-entry-exit" }, { addr = 0x5580C8C63200, call_site = 0x5580C8C63234 }
[10:58:54.371911272] (+0.000000126) pasop-vm lttng_ust_cyg_profile:func_exit: { cpu_id = 2 }, { vpid = 12179, vtid = 12179, procname = "func-entry-exit" }, { addr = 0x5580C8C63200, call_site = 0x5580C8C63234 }
```

Trace Compass
```
/opt/trace-compass/tracecompass  &> /dev/null &
```
Open `1_lttng-ust/1_1_func-entry-exit/ust/uid/1000/64-bit/metadata`
