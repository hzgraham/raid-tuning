#!/bin/bash

#echo 3 > /proc/sys/vm/drop_caches

for i in {512..15360..512}; do
echo $i > /sys/block/md0/md/stripe_cache_size

echo stripe_cache_size ${i} > ~/results.txt

# write
dd if=/dev/zero of=/path/to/file bs=3355443 count=5120 >>

# read
dd if=/path/to/file of=/dev/null bs=3355443 count=5120

done

