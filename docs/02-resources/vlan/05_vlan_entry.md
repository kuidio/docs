# VLAN Entry

`VLAN Entries` in Kuid represent the entries stored in the backend system, providing valuable insights into the state of VLAN configurations. They serve as a key component for troubleshooting and validating the proper behavior of the system.

Given that VLAN Entries are managed as Kubernetes resources, they can be queried programmatically to assess system health or perform specific tasks based on their contents.

## Example Output

The following example output illustrates the structure and contents of VLAN Entries:

```
k get vlanentries.vlan.be.kuid.dev
```

output

```
NAME                        READY   INDEX    CLAIMTYPE       VLANID
index1.100-32               True    index1   staticVLANID    100/32
index1.200-29               True    index1   vlanRange       200/29
index1.208-28               True    index1   vlanRange       208/28
index1.224-27               True    index1   vlanRange       224/27
index1.256-25               True    index1   vlanRange       256/25
index1.384-28               True    index1   vlanRange       384/28
index1.range-claim.200-32   True    index1   staticVLANID    200/32
index1.range-claim.201-32   True    index1   dynamicVLANID   201/32
index1.range-claim.202-32   True    index1   dynamicVLANID   202/32
```