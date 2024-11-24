# IPIndex

An `IPIndex` in Kuid acts as a container for both IPv4 and IPv6 addresses, providing flexible management through associations with specific environments, VRFs, or other entities. This structure enables fine-grained control and segmentation of IP resources across different contexts, allowing for efficient organization and management.

The `IPIndex` supports hierarchical definitions that include IP Prefixes, Ranges, and/or Addresses, facilitating scalable and adaptable IP resource management. Within an `IPIndex`, prefixes can be defined, each resulting in individual `IPClaims` for allocation.

## Example IPIndex

A IPIndex is managed through the `IPIndex` resource. Below is an example YAML manifest demonstrating the configuration of an `IPIndex` named "vpc1":

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPIndex
metadata:
  name: vpc1
  namespace: default
spec:
  prefixes:
  - prefix: 10.0.0.0/8
    labels:
      inv.kuid.dev/test: a
  - prefix: 172.0.0.0/8
    labels:
      inv.kuid.dev/test: b
```

### Expected behavior

Once the `IPIndex` named “vpc1” is created, the status should indicate a `True` Ready condition. This confirms that the `IPIndex` has been successfully provisioned and is ready for use.

## Status

The status of the `IPIndex` is indicated by the `READY` condition. A `True` `READY` condition confirms successful provisioning of the `IPIndex`. If the `READY` condition is `False`, the status includes a reason and message that provide additional context and troubleshooting information.

To check the status of all IPIndex resources, use the following command:

```
kubectl get ipindices.ipam.be.kuid.dev 
```

Example output:

```
NAME   READY   PREFIX0      PREFIX1       PREFIX2   PREFIX3   PREFIX4
vpc1   True    10.0.0.0/8   172.0.0.0/8   
```

