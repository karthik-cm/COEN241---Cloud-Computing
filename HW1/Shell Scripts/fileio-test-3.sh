#!/bin/sh

i=1
while [ $i -lt 6 ]
do
    echo "Test Run #$i"
    sysbench --test=fileio --file-total-size=3G --max-time=30 --max-requests=0 --file-test-mode=rndrw prepare
    sysbench --test=fileio --file-total-size=3G --max-time=30 --max-requests=0 --file-test-mode=rndrw run
    sleep 100
    sysbench --test=fileio --file-total-size=3G --max-time=30 --max-requests=0 --file-test-mode=rndrw cleanup
    i=`expr $i + 1`
done
