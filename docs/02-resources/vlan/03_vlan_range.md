# VLAN Range

Kuid supports the subdivision of VLAN Indexes into ranges, enhancing the flexibility and scalability of VLAN configurations to accommodate diverse network environments and requirements.

## Example

A VLAN range is managed through the `VLANClaim` Custom Resource (CR), requiring specific parameters such as the VLAN index from which the VLAN is claimed and the start and end VLAN identifiers of the range. Below is an example YAML manifest demonstrating the configuration of a VLAN range claim:


```yaml
apiVersion: vlan.be.kuid.dev/v1alpha1
kind: VLANClaim
metadata:
  name: range-claim
spec:
  index: index1
  range: 200-399
```

## Status

The status of the `VLANClaim` is indicated using the READY condition. A True Ready condition indicates a successful VLAN range claim in the system. The claimed VLAN range is also displayed in the status.

```
kubectl get vlanclaims.vlan.be.kuid.dev static-claim
```

```
NAME            READY   INDEX    CLAIMTYPE      CLAIMREQ   CLAIMRSP
range-claim     True    index1   vlanRange       200-399    200-399
```

If a `VLANClaim` is unsuccessful, the condition will indicate the reason for the failure. For example, a `VLANClaim` cannot overlap with existing entries.

## Status

Upon successful creation of the VLAN range claim, the status should indicate a True Ready condition, confirming that the VLAN range has been successfully claimed in the system.