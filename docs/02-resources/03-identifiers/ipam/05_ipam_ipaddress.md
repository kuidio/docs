# IP Address

An `IP Address` refers to an individual address within an IP Range or Prefix, assigned to a specific resource or endpoint. The system ensures that each address is unique within its assigned context and can be allocated either statically or dynamically as needed.

!!! Note "The `prefixType` of the `IP Address` is determined by its parent prefix."

## Static IP address

Static IP address are explicitly defined with a specific Prefix or Range and are managed through a `IPClaim` resource. Each static IP address is associated with a `index` and and a unique `address` in prefix notation.

### Example static IP Address within a prefix

A static IP address `IPClaim` within a prefix is configured using the address-based prefix length notation. Below is an example:

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.172.0.0.1-32
spec:
  index: vpc1
  address: 172.0.0.1/32
```

### Example static IP Address within a network prefix

For a static IP address `IPClaim` within a network prefix, the prefix notation follows the length of the network prefix. When a default gateway is assigned within the IP prefix, it is also reflected in the status of the IPClaim.

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.10.0.0.2-24
spec:
  index: vpc1
  address: 10.0.0.2/24
```

### Example static IP Address within a range

A static IP address `IPClaim` within a range follows the same prefix notation with the address-based prefix length.

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.10.0.0.10-32
spec:
  index: vpc1
  address: 10.0.0.10/32
```

### Expected behavior

Once the address based `IPCLaim` is created, the status should indicate a `True` Ready condition. This confirms that the `IPCLaim` has been successfully provisioned and is ready for use.

## Dynamic IP address

Dynamic IP Addresses are automatically assigned by the system and managed through the `IPClaim` resource, without explicitly specifying an address. Selectors can be used for fine-grained selection, and user-defined labels enable flexible property assignments.

### Example dynamic IP Address

Below is an example of a dynamic IP address claim where labels are used for context and selectors are used for fine graned selection:

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: net1-claim1
spec:
  index: vpc1
  selector:
    matchLabels:
      inv.kuid.dev/network: net1
  labels:
    inv.kuid.dev/endpoint-name: claim1
```

### Expected behavior

Upon successful creation of the dynamic `IPClaim`, the status should indicate a `True` `READY` condition, confirming that the IP address has been successfully claimed. If the IP address is claimed from a network prefix, the status reflects the address with the prefix length of the parent prefix, and optionally includes the default gateway if assigned within the network prefix. For all other allocations, the address-based prefix notation is used.

## Status

The status of the `IPClaim` is indicated by the `READY` condition. A `True` `READY` condition confirms successful provisioning of the `IPClaim`. If the `READY` condition is `False`, the status includes a reason and message that provide additional context and troubleshooting information.

To check the status of all IPClaims, use the following command:

```
kubectl get ipclaims.ipam.be.kuid.dev
```

Example output:

```
NAME                       READY   INDEX   CLAIMTYPE        PREFIXTYPE   CLAIMREQ              CLAIMRSP              DEFAULTGATEWAY
net1-claim1                True    vpc1    dynamicAddress   other                              10.0.0.254/24         10.0.0.1
range1-claim1              True    vpc1    dynamicAddress   other                              10.0.0.11/32 
```