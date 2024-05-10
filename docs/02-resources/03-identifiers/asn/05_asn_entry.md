# AS Entry

`AS Entries` in Kuid represent the entries stored in the backend system, providing valuable insights into the state of AS configurations. They serve as a key component for troubleshooting and validating the proper behavior of the system.

Given that AS Entries are managed as Kubernetes resources, they can be queried programmatically to assess system health or perform specific tasks based on their contents.

## Example Output

The following example output illustrates the structure and contents of AS Entries:

```
k get asentries.as.be.kuid.dev
```

output

```
NAME                     READY   INDEX    CLAIMTYPE     ID
index1.1499547-32        True    index1   staticASID    1499547/32
index1.64512-23          True    index1   asRange       64512/23
index1.65024-24          True    index1   asRange       65024/24
index1.65280-25          True    index1   asRange       65280/25
index1.65408-26          True    index1   asRange       65408/26
index1.65472-27          True    index1   asRange       65472/27
index1.65504-28          True    index1   asRange       65504/28
index1.65520-29          True    index1   asRange       65520/29
index1.65528-30          True    index1   asRange       65528/30
index1.65532-31          True    index1   asRange       65532/31
index1.65534-32          True    index1   asRange       65534/32
index1.65535-32          True    index1   dynamicASID   65535/32
index1.range1.64512-32   True    index1   dynamicASID   64512/32
```