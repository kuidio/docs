# IP Prefix

In Kuid’s IPAM system, IP addresses are managed within a hierarchical structure of IP Prefixes within an IPIndex. The system supports two prefixTypes:

Network Prefixes: 

  - Used for device interfaces with physical or virtual NICs. 
  - Network and broadcast addresses are pre-allocated in the IPAM backend (except for IPv4 /31 and IPv6 /127 prefixes).
  - Cannot be nested

Regular Prefixes: 

  - Used for IP prefix hierarchies, IP pools, etc. 
  - Network and broadcast addresses are NOT pre-allocated in the IPAM backend.
  - Can be nested

## Static IP Prefix

Static `IP Prefixes` are managed via an `IPClaim` resource with an explicitly defined prefix within an index.

### Example static IP Prefix with prefixType = network

A static `IP Prefix` is configured by specifying the `index`, setting the `prefixType` to `network`, and providing the static `prefix` in the `IPClaim` resource. Optionally, a `defaultGateway` can be assigned, and user-defined `labels` can be added for additional context.

For `prefixType` = network, the IPAM backend pre-allocates the network and broadcast addresses, unless the prefix length is IPv4 /31 or IPv6 /127.

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.10.0.0.1-24
  namespace: default
spec:
  index: vpc1
  prefixType: network
  prefix: 10.0.0.1/24
  defaultGateway: true
  labels:
    inv.kuid.dev/network: net1
```

### Example static IPPrefix with no prefixType

A static `IP prefix` can also be configured without specifying a `prefixType`. User-defined labels can be added for additional context.

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.172.0.0.0-16
  namespace: default
spec:
  index: vpc1
  prefix: 172.0.0.0/16
```

### Expected behavior

Once the prefix based `IPCLaim` is created, the status should indicate a `True` Ready condition. This confirms that the `IPCLaim` has been successfully provisioned and is ready for use.

## Dynamic IP Prefix

Dynamic `IP Prefix` are prefixes that are automatically assigned by the system and managed through the `IPClaim` resource without specifying a prefix. Optionally, dynamic prefixes can be restricted to specific prefixes using label selectors. 

### Example dynamic IP Prefix

A dynamic IP prefix is created by specifying the `index`, `createPrefix` (set to true), and `prefixLength` in the `IPClaim` resource. Optionally, you can specify `prefixType`, `labels`, or `selector` for further customization.

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.prefix-claim1
  namespace: default
spec:
  index: vpc1
  prefixType: network
  createPrefix: true
  prefixLength: 24
  labels:
    inv.kuid.dev/network: dyn-net1
#  selector:
#    matchLabels:
#      inv.kuid.dev/test: a
```

### Expected behavior

Once the prefix based `IPCLaim` is created, the status should indicate a `True` Ready condition. This confirms that the `IPCLaim` has been successfully provisioned and is ready for use.

## Status

The status of the `IPClaim` is indicated by the `READY` condition. A `True` `READY` condition confirms successful provisioning of the `IPClaim`. If the `READY` condition is `False`, the status includes a reason and message that provide additional context and troubleshooting information.

To check the status of all IPClaims, use the following command:

```
kubectl get ipclaims.ipam.be.kuid.dev
```

Example output:

```
NAME                 READY   INDEX   CLAIMTYPE       PREFIXTYPE   CLAIMREQ      CLAIMRSP      DEFAULTGATEWAY
vpc1.10.0.0.0-8      True    vpc1    staticPrefix    other        10.0.0.0/8    10.0.0.0/8    
vpc1.10.0.0.1-24     True    vpc1    staticPrefix    network      10.0.0.1/24   10.0.0.1/24   10.0.0.1
vpc1.172.0.0.0-8     True    vpc1    staticPrefix    other        172.0.0.0/8   172.0.0.0/8   
vpc1.prefix-claim1   True    vpc1    dynamicPrefix   network                    10.0.1.0/24 
```
