/**
 * Example for using tracef and tracelog functions
 * build with:
 * gcc -g -O2 -finstrument-functions tracef_tracelog.c -o tracef_tracelog
 */
#include <stdio.h>
#include <lttng/tracef.h>   /* LTTng-UST include for tracef */
#include <lttng/tracelog.h> /* LTTng-UST include for tracelog */

int fibonacci_tracef(int i)
{
    /* printf like trace */
    tracef("calling fibonacci_tracef with i=%d", i);

    if (i == 0) {
        return 0;
    }

    if (i == 1) {
        return 1;
    }

    return fibonacci_tracef(i-1) + fibonacci_tracef(i-2);
}

int fibonacci_tracelog(int i)
{
    tracelog(TRACE_WARNING,
             "calling fibonacci_tracelog TRACE_WARNING with i=%d", i);
    tracelog(TRACE_ERR,
             "calling fibonacci_tracelog TRACE_ERR with i=%d", i);

    if (i == 0) {
        return 0;
    }

    if (i == 1) {
        return 1;
    }

    return fibonacci_tracelog(i-1) + fibonacci_tracelog(i-2);
}

int main(int argc, char *argv[])
{
    int i;

    for (i = 0; i < 10; i++) {
        printf("%d\t\n", fibonacci_tracef(i));
    }

    for (i = 0; i < 10; i++) {
        printf("%d\t\n", fibonacci_tracelog(i));
    }

    return 0;
}
