# LTTng-UST Pre-Build Helpers

Simple example of tracing by using all pre-build helpers from LTTng-UST which are
```
liblttng-ust-libc-wrapper.so
liblttng-ust-pthread-wrapper.so
liblttng-ust-dl.so
liblttng-ust-cyg-profile.so
```
don't forget to build with `--finstrument-functions`

quick show pre-build-helpers.c
explain traceme.sh

```
cd 1_lttng-ust/1_2_pre-build-helpers
make clean && make
./traceme.sh ./pre-build-helpers
```

Console output
```
[11:17:48.130302839] (+0.000004404) pasop-vm lttng_ust_pthread:pthread_mutex_unlock: { cpu_id = 2 }, { vpid = 14591, vtid = 14596, procname = "pre-build-helpe" }, { mutex = 0x7FF7D749C4E0, status = 0 }
[11:17:48.130305313] (+0.000002474) pasop-vm lttng_ust_pthread:pthread_mutex_lock_req: { cpu_id = 2 }, { vpid = 14591, vtid = 14596, procname = "pre-build-helpe" }, { mutex = 0x7FF7D749C4A0 }
[11:17:48.130305969] (+0.000000656) pasop-vm lttng_ust_pthread:pthread_mutex_lock_acq: { cpu_id = 2 }, { vpid = 14591, vtid = 14596, procname = "pre-build-helpe" }, { mutex = 0x7FF7D749C4A0, status = 0 }
[11:17:48.130306664] (+0.000000695) pasop-vm lttng_ust_pthread:pthread_mutex_unlock: { cpu_id = 2 }, { vpid = 14591, vtid = 14596, procname = "pre-build-helpe" }, { mutex = 0x7FF7D749C4A0, status = 0 }
[11:17:48.130309358] (+0.000002694) pasop-vm lttng_ust_libc:free: { cpu_id = 2 }, { vpid = 14591, vtid = 14596, procname = "pre-build-helpe" }, { ptr = 0x0 }
[11:17:48.130574803] (+0.000265445) pasop-vm lttng_ust_cyg_profile:func_exit: { cpu_id = 1 }, { vpid = 14591, vtid = 14591, procname = "pre-build-helpe" }, { addr = 0x5602F9B55260, call_site = 0x7FF7D75570B3 }
[11:17:48.130621850] (+0.000047047) pasop-vm lttng_ust_pthread:pthread_mutex_lock_req: { cpu_id = 1 }, { vpid = 14591, vtid = 14591, procname = "pre-build-helpe" }, { mutex = 0x7FF7D7524620 }
```

Trace Compass
```
/opt/trace-compass/tracecompass  &> /dev/null &
```
Open `1_lttng-ust/1_2_pre-build-helpers/ust/uid/1000/64-bit/metadata`

