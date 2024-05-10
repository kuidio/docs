# Node

In `Kuid`, a `Node` represents a fundamental unit that implements compute, storage, and/or networking within your environment. Nodes can embody physical, virtual, or containerized entities, offering versatility in deployment options to suit diverse infrastructure requirements.

`Nodes` are logically organized within `racks` and `sites/regions`, establishing a hierarchical structure for efficient resource management and organization. Additionally, `Nodes` are associated with administrative domains, facilitating centralized management and control within defined administrative boundaries.

Each `Node` is assigned a `provider`, representing the entity responsible for implementing the specifics of the `Node`. This ensures clear ownership and responsibility for managing and maintaining the Node resource, contributing to streamlined infrastructure provisioning and management processes.

## Parameters

Domain (mandatory)

Region (mandatory)

Site (mandatory)

Rack (optional)

Position (optional)

Location (optional)

Provider (mandatory)
