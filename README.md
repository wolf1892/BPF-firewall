# Block application specific port using BPF


-Caveats : If two process:port are blocked using cgroup, process2 port might be affected with process1 port.


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

