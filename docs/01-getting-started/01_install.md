<script type="text/javascript" src="https://viewer.diagrams.net/js/viewer-static.min.js" async></script>

First ensure the [pre-requisites](02_prereq.md) are met

## Install Kuid

Once the cluster is deployed we install the `kuid` server. These manifests deploys kuid as a deployment:

1. the kuid container embeds an apiserver and various controllers

```
kubectl apply -f https://docs.kuid.dev/kuid-repo/artifacts/out/artifacts.yaml
```

/// details | Artifact Content

```yaml
--8<--
kuid-repo/artifacts/out/artifacts.yaml
--8<--
```

///

if successfull you should see a running container similar to this

```
kubectl get pods -n network-system
```

output

```
NAME                             READY   STATUS    RESTARTS   AGE
config-server-7fcd95b976-p2pn7   2/2     Running   0          3d5h
```