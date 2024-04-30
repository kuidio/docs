# VXLAN

In Kuid, VXLANs are managed according [RFC7348](https://datatracker.ietf.org/doc/html/rfc7348), ensuring adherence to industry best practices for network segmentation and organization. VXLANs are logically organized within VXLAN Indexes, providing a structured framework for VXLAN management.

## Static VXLAN

Static VXLANs are explicitly defined with a specific VXLAN ID and are managed through the VXLANClaim Custom Resource (CR). Each static VXLAN is associated with a VXLAN index and a unique VXLAN ID. If a static VXLAN is defined within a VXLAN Range it is associated to the VXLAN Range within the VXLAN Indez. Below is an example of static VXLAN configurations:

### Example static VXLAN

A static VXLAN is configured by specifying the VXLAN index and the static VXLAN ID in the `VXLANClaim` CR:

```yaml
apiVersion: vxlan.be.kuid.dev/v1alpha1
kind: VXLANClaim
metadata:
  name: index1.claim1
spec:
  index: index1
  id: 100000
```

### Expected behavior

Upon successful creation of the static `VXLANClaim` "index1.claim1", the status should indicate a True Ready condition, confirming that the VXLAN has been successfully claimed with the specified VXLAN ID.

## Dynamic VXLAN

Dynamic VXLANs are automatically assigned VXLAN IDs by the system and are managed through the `VXLANClaim` CR without specifying a VXLAN ID. Optionally, dynamic VXLANs can be restricted to specific VXLAN ranges using label selectors. Below are examples of dynamic VXLAN configurations:

### Example dynamic VXLAN

A dynamic VXLAN is configured by specifying only the VXLAN index in the `VXLANClaim` CR:

```yaml
apiVersion: vxlan.be.kuid.dev/v1alpha1
kind: VXLANClaim
metadata:
  name: index1.claim2
spec:
  index: index1
```

## Example dynamic VXLAN within a range

A dynamic VXLAN can be restricted to a specific VXLAN range using label selectors in the `VXLANClaim` CR:

```yaml
apiVersion: vxlan.be.kuid.dev/v1alpha1
kind: VXLANClaim
metadata:
  name: index1.claim3
spec:
  index: index1
  selector:
    matchLabels:
      be.kuid.dev/claim-name: index1.range1
```
### Expected behavior

Upon successful creation of the dynamic `VXLANClaim`, the status should indicate a True Ready condition, confirming that the VXLAN has been successfully claimed with an automatically assigned VXLAN ID.

## Status

The status of VXLANClaims is indicated using the READY condition. A True Ready condition indicates a successful VXLANClaim. When the Ready condition status is False, the reason and message information in the status provide additional details.

```
kubectl get vxlanclaims.vxlan.be.kuid.dev --all
```

status of the static or dynamic VXLAN Claims

```
NAME            READY   INDEX    CLAIMTYPE        CLAIMREQ     CLAIMRSP
index1.claim1   True    index1   staticVXLANID    100000       100000
index1.claim2   True    index1   dynamicVXLANID                0
index1.claim3   True    index1   dynamicVXLANID                1024
index1.range1   True    index1   vxlanRange       1024-65535   1024-65535
```
