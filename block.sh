#!/bin/bash
echo -n "Enter process PID: " 
read pid
echo $pid > /sys/fs/cgroup/block/cgroup.procs

python main.py -c /sys/fs/cgroup/block
