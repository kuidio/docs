# Network Instance

IP resources are managed through a `NetworkInstance` CR. A `NetworkInstance` holds a routing table context in which the ip resources are managed. Both IPV4 and IPv6 addresses are supported within a network instance. The aggregate prefixes within a netowrk instance are defined when creating/updating the networkInstamce. A single Aggregate Prefix is required otherwise the networkInstance will not turn its status to ready


## Example

A NetworkInstance is managed through the `NetworkInstance` CRD. A single prefix is required to get the network instance ready status

```yaml
apiVersion: ipam.res.kuid.dev/v1alpha1
kind: NetworkInstance
metadata:
  name: vpc1
spec:
  prefixes:
  - prefix: 10.0.0.0/8
  - prefix: 172.0.0.0/8
```

## Status

The status of the NetworkInstance is indicated using the READY condition. A True Ready condition indicates the NetworkInstance was successfull claimed in the system. When the Ready condition status is False the reason and message information in the status provide additional information.

```
kubectl get vlanindices.vlan.be.kuid.dev 
```

status

```
NAME     READY
index1   True
```