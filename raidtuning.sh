#!/bin/bash


for i in {512..15360..512}; do

echo 3 > /proc/sys/vm/drop_caches

echo $i > /sys/block/md0/md/stripe_cache_size

echo stripe_cache_size ${i} >> /tmp/results.txt

# write
dd if=/dev/zero of=/mnt/testwrite.txt bs=3355443 count=5120 >> /tmp/results.txt

echo 3 > /proc/sys/vm/drop_caches

# read
dd if=/mnt/testread.txt of=/dev/null bs=3355443 count=5120 >> /tmp/results.txt

done
