# Block application specific port using BPF


-Caveats : If two process:port are blocked using cgroup, process2 port might be affected with process1 port.

#Demo


The demo shows, how process(port) specific blocking can be done with eBPF. Here we take an example of process(PID: 2836) to block all its communications on port 8000 but allowing other process to communicate with port 8000; thereby only blocking comms(specific to port) of process(2836)

Following commands were ran before demo.
```sudo mkdir /sys/fs/cgroup/cg1 #make new cgroup
echo 2836 > /sys/fs/cgroup/cg1/cgroup.procs #move pid to new cgroup
```


![Alt Text](https://raw.githubusercontent.com/wolf1892/temp1/main/Untitled%20Project.gif)




## Architecture

![arch](https://raw.githubusercontent.com/wolf1892/temp1/main/architect.png?raw=true)


## Usage

For first time usage setup empty cgroupv2

```
#setup new dir under /sys/fs/cgroup under name block
./init.sh
```
Trigger block.sh
```
#moves process defined to new cgroup and triggers main.py
./block.sh
```


## Notes
SOCK_OPS -> Triggers when TCP events such as connection establishment, tcp retransmit, etc
Program referenced from bcc/examples/sockmap.py

