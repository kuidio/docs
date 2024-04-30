# AS Range

Kuid supports the subdivision of AS Indexes into ranges, enhancing the flexibility and scalability of AS configurations to accommodate diverse network environments and requirements.

## Example

A AS range is managed through the `ASClaim` Custom Resource (CR), requiring specific parameters such as the AS index from which the AS is claimed and the start and end AS identifiers of the range. Below is an example YAML manifest demonstrating the configuration of a AS range claim:


```yaml
apiVersion: as.be.kuid.dev/v1alpha1
kind: ASClaim
metadata:
  name: index1.range1
spec:
  index: index1
  range: 1024-65535
```

## Status

The status of the `ASClaim` is indicated using the READY condition. A True Ready condition indicates a successful AS range claim in the system. The claimed AS range is also displayed in the status.

```
kubectl get asclaims.as.be.kuid.dev index1.range1
```

```
NAME            READY   INDEX    CLAIMTYPE   CLAIMREQ      CLAIMRSP
index1.range1   True    index1   asRange     64512-65534   64512-65534
```

If a `ASClaim` is unsuccessful, the condition will indicate the reason for the failure. For example, a `ASClaim` cannot overlap with existing entries.

## Status

Upon successful creation of the ASN range claim, the status should indicate a True Ready condition, confirming that the ASN range has been successfully claimed in the system.