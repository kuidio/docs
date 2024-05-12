# Node

A `Node` in `kuid` represents a fundamental unit that implements compute, storage, and/or networking within your environment. Nodes can embody physical, virtual, or containerized entities, offering versatility in deployment options to suit diverse infrastructure requirements.

`Nodes` are logically organized within `racks` and `sites/regions`, establishing a hierarchical structure for efficient resource management and organization. Additionally, `Nodes` are associated with `NodeGroups`, facilitating centralized management and control within defined administrative boundaries.

Each `Node` is assigned a `provider`, representing the entity responsible for implementing the specifics of the `Node`.

!!!note "We've opted for the name `node` instead of `device` as it better encompasses the scope we aim to cover. While 'device' often implies a physical entity, we intend to model both physical and virtual, including containerized entities within our system"

## Parameters

Domain (mandatory)

Region (mandatory)

Site (mandatory)

Rack (optional)

Position (optional)

Location (optional)

Provider (mandatory)
