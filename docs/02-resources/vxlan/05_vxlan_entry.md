# VXLAN Entry

`VXLAN Entries` in Kuid represent the entries stored in the backend system, providing valuable insights into the state of VXLAN configurations. They serve as a key component for troubleshooting and validating the proper behavior of the system.

Given that VXLAN Entries are managed as Kubernetes resources, they can be queried programmatically to assess system health or perform specific tasks based on their contents.

## Example Output

The following example output illustrates the structure and contents of VXLAN Entries:

```
k get vxlanentries.vxlan.be.kuid.dev
```

output

```
NAME                    READY   INDEX    CLAIMTYPE        VXLANID
index1.0-32             True    index1   dynamicVXLANID   0/32
index1.100000-32        True    index1   staticVXLANID    100000/32
index1.1024-22          True    index1   vxlanRange       1024/22
index1.16384-18         True    index1   vxlanRange       16384/18
index1.2048-21          True    index1   vxlanRange       2048/21
index1.32768-17         True    index1   vxlanRange       32768/17
index1.4096-20          True    index1   vxlanRange       4096/20
index1.8192-19          True    index1   vxlanRange       8192/19
index1.range1.1024-32   True    index1   dynamicVXLANID   1024/32
```