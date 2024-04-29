# IP Prefix


## Example

A NetworkInstance is managed through the `NetworkInstance` CRD. A single prefix is required to get the network instance ready status

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.10.0.0.1-24
spec:
  networkInstance: vpc1
  prefix: 10.0.0.0/16
  labels:
    inv.kuid.dev/network: net1
```

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.10.0.0.1-24
spec:
  networkInstance: vpc1
  prefixType: network
  prefix: 10.0.0.1/24
  defaultGateway: true
  labels:
    inv.kuid.dev/network: net1
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