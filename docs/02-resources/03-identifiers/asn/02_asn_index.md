# AS Index

A `ASIndex` serves as a container for ASNs, defining a specific scope for their management. Each `ASIndex` can be associated with an environment, providing clarity on its intended scope. Within a `ASIndex`, a designated minimum and maximum ASN ID can be defined. Each ASN within an index must possess a unique ID and name, facilitating clear identification and organization. 

Within an `ASIndex`, claims can be defined, each resulting in individual `ASClaims` for allocation.

## Example

A AS Index is managed through the `ASIndex` Custom Resource Definition (CRD). Below is an example YAML manifest demonstrating the configuration of a AS Index named "index1":

```yaml
apiVersion: as.be.kuid.dev/v1alpha1
kind: ASIndex
metadata:
  name: index1
spec:
  labels:
    inv.kuid.dev/topology: topo1
  claims:
  - name: aspool
    range: 65000-65100
  - name: ibgp
    id: 65535
```

## Status

he status of the `ASIndex` is indicated using the READY condition. A True Ready condition indicates the ASIndex was successful. When the Ready condition status is False, the reason and message information in the status provide additional details.

```
kubectl get asindices.as.be.kuid.dev
```

status

```shell
NAME     READY   MINID   MAXID
index1   True 
```

Upon successful creation of the AS Index "index1," the status should indicate a True Ready condition, confirming that the AS Index has been successfully provisioned.

## Expected behavior

Upon successful creation of the `ASIndex` "index1," the status should indicate a True Ready condition, confirming that the AS Index has been successfully provisioned.