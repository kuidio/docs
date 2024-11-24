# IP Range

An `IP Range` defines a continuous block of IP addresses within an IP Prefix, allowing for efficient assignment and management of IP addresses within a defined range. This is useful for allocating addresses to devices or services within a specific scope while maintaining control over address distribution.

### Example IP Range

An IP Range is managed through a `IPClaim` resource where the `range` and `index` parameters are set.
The range parameter in the `IPClaim` follows the following notation `<address>-<address>`.

!!! Note "A range must be contained within a valid IP prefix; it cannot span multiple prefixes."

```yaml
apiVersion: ipam.be.kuid.dev/v1alpha1
kind: IPClaim
metadata:
  name: vpc1.10.0.0.10-10.0.0.19
  namespace: default
spec:
  index: vpc1
  range: 10.0.0.10-10.0.0.19
```

### Expected behavior

Once the range based `IPCLaim` is created, the status should indicate a `True` Ready condition. This confirms that the `IPCLaim` has been successfully provisioned and is ready for use.

## Status

The status of the `IPClaim` is indicated by the `READY` condition. A `True` `READY` condition confirms successful provisioning of the `IPClaim`. If the `READY` condition is `False`, the status includes a reason and message that provide additional context and troubleshooting information.

To check the status of all IPClaims, use the following command:

```
kubectl get ipclaims.ipam.be.kuid.dev
```

Example output:

```
NAME                 READY   INDEX   CLAIMTYPE       PREFIXTYPE   CLAIMREQ      CLAIMRSP      DEFAULTGATEWAY
vpc1.10.0.0.10-10.0.0.19   True    vpc1    staticRange     other        10.0.0.10-10.0.0.19   10.0.0.10-10.0.0.19 
```
