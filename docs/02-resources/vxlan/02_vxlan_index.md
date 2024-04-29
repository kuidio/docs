# VXLAN Index

A `VXLANIndex` serves as a container for VXLANs, defining a specific scope for their management. Each `VXLANIndex` can be associated with an environment, providing clarity on its intended scope. Within a `VXLANIndex`, a designated minimum and maximum VXLAN ID are defined. Each VXLAN within an index must possess a unique ID and name, facilitating clear identification and organization. 

## Example

A VXLAN Index is managed through the `VXLANIndex` Custom Resource Definition (CRD). Below is an example YAML manifest demonstrating the configuration of a VXLAN Index named "index1":

```yaml
apiVersion: vxlan.be.kuid.dev/v1alpha1
kind: VXLANIndex
metadata:
  name: index1
spec:
  labels:
    inv.kuid.dev/topology: topo1
```

## Status

he status of the `VXLANIndex` is indicated using the READY condition. A True Ready condition indicates the VXLANIndex was successful. When the Ready condition status is False, the reason and message information in the status provide additional details.

```
kubectl get vxlanindices.vxlan.be.kuid.dev 
```

status

```
NAME     READY
index1   True
```

Upon successful creation of the VXLAN Index "index1," the status should indicate a True Ready condition, confirming that the VXLAN Index has been successfully provisioned.

## Expected behavior

Upon successful creation of the `VXLANIndex` "index1," the status should indicate a True Ready condition, confirming that the VXLAN Index has been successfully provisioned.