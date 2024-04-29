# VXLAN Range

Kuid supports the subdivision of VXLAN Indexes into ranges, enhancing the flexibility and scalability of VXLAN configurations to accommodate diverse network environments and requirements.

## Example

A VXLAN range is managed through the `VXLANClaim` Custom Resource (CR), requiring specific parameters such as the VXLAN index from which the VXLAN is claimed and the start and end VXLAN identifiers of the range. Below is an example YAML manifest demonstrating the configuration of a VXLAN range claim:


```yaml
apiVersion: vxlan.be.kuid.dev/v1alpha1
kind: VXLANClaim
metadata:
  name: index1.range1
spec:
  index: index1
  range: 1024-65535
```

## Status

The status of the `VXLANClaim` is indicated using the READY condition. A True Ready condition indicates a successful VXLAN range claim in the system. The claimed VXLAN range is also displayed in the status.

```
kubectl get vxlanclaims.vxlan.be.kuid.dev static-claim
```

```
NAME            READY   INDEX    CLAIMTYPE    CLAIMREQ     CLAIMRSP
index1.range1   True    index1   vxlanRange   1024-65535   1024-65535
```

If a `VXLANClaim` is unsuccessful, the condition will indicate the reason for the failure. For example, a `VXLANClaim` cannot overlap with existing entries.

## Status

Upon successful creation of the VXLAN range claim, the status should indicate a True Ready condition, confirming that the VXLAN range has been successfully claimed in the system.