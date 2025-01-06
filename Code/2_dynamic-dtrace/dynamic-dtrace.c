/**
 * LTTng dynamic user space tracing example
 * build with gcc -g -O2 dynamic-dtrace.c -o dynamic-dtrace
 * 
 * Precondition: sudo apt-get install systemtap-sdt-dev
 *
 * What is an SDT Probe?
 * Statically Defined Tracing Probe
 * Data gathering at specific points in the code
 * Implemented by DTRACE_PROBE* macros in <sys/sdt.h>
 * When the probe is not enabled, there are a sequence of “nops” in the binary,
 * making for minimal impact.
 */

#include <sys/sdt.h>

void func(void)
{
    DTRACE_PROBE(my_provider, my_probe);
}

int main(int argc, char **argv)
{
    func();
    return 0;
}
