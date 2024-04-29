# VLAN

In Kuid, VLANs are managed according to IEEE 802.1Q standards, ensuring adherence to industry best practices for network segmentation and organization. VLANs are logically organized within VLAN Indexes, providing a structured framework for VLAN management.

## Static VLAN

Static VLANs are explicitly defined with a specific VLAN ID and are managed through the VLANClaim Custom Resource (CR). Each static VLAN is associated with a VLAN index and a unique VLAN ID. If a static VLAN is defined within a VLAN Range it is associated to the VLAN Range within the VLAN Indez. Below is an example of static VLAN configurations:

### Example static VLAN

A static VLAN is configured by specifying the VLAN index and the static VLAN ID in the `VLANClaim` CR:

```yaml
apiVersion: vlan.be.kuid.dev/v1alpha1
kind: VLANClaim
metadata:
  name: static-claim
spec:
  index: index1
  id: 100
```

### Expected behavior

Upon successful creation of the static `VLANClaim` "static-claim," the status should indicate a True Ready condition, confirming that the VLAN has been successfully claimed with the specified VLAN ID.

## Dynamic VLAN

Dynamic VLANs are automatically assigned VLAN IDs by the system and are managed through the `VLANClaim` CR without specifying a VLAN ID. Optionally, dynamic VLANs can be restricted to specific VLAN ranges using label selectors. Below are examples of dynamic VLAN configurations:

### Example dynamic VLAN

A dynamic VLAN is configured by specifying only the VLAN index in the `VLANClaim` CR:

```yaml
apiVersion: vlan.be.kuid.dev/v1alpha1
kind: VLANClaim
metadata:
  name: dynamic-claim
spec:
  index: index1
```

## Example dynamic VLAN within a range

A dynamic VLAN can be restricted to a specific VLAN range using label selectors in the `VLANClaim` CR:

```yaml
apiVersion: vlan.be.kuid.dev/v1alpha1
kind: VLANClaim
metadata:
  name: dynamic-claim
spec:
  index: index1
  selector:
    matchLabels:
      be.kuid.dev/claim-name: range1
```
### Expected behavior

Upon successful creation of the dynamic `VLANClaim`, the status should indicate a True Ready condition, confirming that the VLAN has been successfully claimed with an automatically assigned VLAN ID.

## Status

The status of VLANClaims is indicated using the READY condition. A True Ready condition indicates a successful VLANClaim. When the Ready condition status is False, the reason and message information in the status provide additional details.

```
kubectl get vlanclaims.vlan.be.kuid.dev --all
```

status static claim

```
NAME           READY   INDEX    CLAIMTYPE      CLAIMREQ   CLAIMRSP
static-claim   True    index1   staticVLANID   100        100
```

statuc dynamic claim

```
NAME            READY   INDEX    CLAIMTYPE      CLAIMREQ   CLAIMRSP
dynamic-claim   True    index1   dynamicVLANID              2
```