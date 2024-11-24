# VLAN Index

A `VLANIndex` serves as a container for VLANs, defining a specific scope for their management. Each `VLANIndex` can be associated with a site, rack, interface, or similar entity, providing clarity on its intended scope. Within a `VLANIndex`, a designated minimum and maximum VLAN ID are defined, typically set to the standard values of 1 and 4094, respectively. Each VLAN within an index must possess a unique ID and name, facilitating clear identification and organization. 

## Example

A VLAN Index is managed through the `VLANIndex` resource. Below is an example YAML manifest demonstrating the configuration of a VLAN Index named "index1":

```yaml
apiVersion: vlan.be.kuid.dev/v1alpha1
kind: VLANIndex
metadata:
  name: index1
spec:
  labels:
    inv.kuid.dev/site: us-west-1 

```

## Status

The status of the `VLANIndex` is indicated using the READY condition. A True Ready condition indicates the `VLANIndex` was successful. When the Ready condition status is False, the reason and message information in the status provide additional details.

```
kubectl get vlanindices.vlan.be.kuid.dev 
```

status

```
NAME     READY
index1   True
```

## Expected behavior

Upon successful creation of the `VLANIndex` "index1", the status should indicate a True Ready condition, confirming that the `VLANIndex` has been successfully provisioned.