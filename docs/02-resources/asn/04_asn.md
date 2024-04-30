# AS

In Kuid, ASs are managed as 32-bit or 64-bit identifiers. ASs are logically organized within AS Indexes, providing a structured framework for AS management.

## Static AS

Static ASs are explicitly defined with a specific AS ID and are managed through the ASClaim Custom Resource (CR). Each static AS is associated with a AS index and a unique AS ID. If a static AS is defined within a AS Range it is associated to the AS Range within the AS Indez. Below is an example of static AS configurations:

### Example static AS

A static AS is configured by specifying the AS index and the static AS ID in the `ASClaim` CR:

```yaml
apiVersion: as.be.kuid.dev/v1alpha1
kind: ASClaim
metadata:
  name: index1.claim1
spec:
  index: index1
  id: 1499547
```

### Expected behavior

Upon successful creation of the static `ASClaim` "index1.claim1", the status should indicate a True Ready condition, confirming that the AS has been successfully claimed with the specified AS ID.

## Dynamic AS

Dynamic ASs are automatically assigned AS IDs by the system and are managed through the `ASClaim` CR without specifying a AS ID. Optionally, dynamic ASs can be restricted to specific AS ranges using label selectors. Below are examples of dynamic AS configurations:

### Example dynamic AS

A dynamic AS is configured by specifying only the AS index in the `ASClaim` CR:

```yaml
apiVersion: as.be.kuid.dev/v1alpha1
kind: ASClaim
metadata:
  name: index1.claim2
spec:
  index: index1
```

## Example dynamic AS within a range

A dynamic AS can be restricted to a specific AS range using label selectors in the `ASClaim` CR:

```yaml
apiVersion: as.be.kuid.dev/v1alpha1
kind: ASClaim
metadata:
  name: index1.claim3
spec:
  index: index1
  selector:
    matchLabels:
      be.kuid.dev/claim-name: index1.range1
```
### Expected behavior

Upon successful creation of the dynamic `ASClaim`, the status should indicate a True Ready condition, confirming that the `AS` has been successfully claimed with an automatically assigned AS ID.

## Status

The status of ASClaims is indicated using the READY condition. A True Ready condition indicates a successful ASClaim. When the Ready condition status is False, the reason and message information in the status provide additional details.

```
kubectl get asclaims.as.be.kuid.dev --all
```

status of the static or dynamic AS Claims. The spec and status of the ASClaims are managed using ASPLain notation, while the user is presented using ASdot notation.

```
NAME            READY   INDEX    CLAIMTYPE     CLAIMREQ      CLAIMRSP
index1.claim1   True    index1   staticASID    22.57755      22.57755
index1.claim2   True    index1   dynamicASID                 65535
index1.claim3   True    index1   dynamicASID                 64512
index1.range1   True    index1   asRange       64512-65534   64512-65534
```
