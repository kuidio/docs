# Endpoint

An `endpoint` in `kuid` represents a communication interface or connection point within a Node, facilitating network communication and data transfer between different components or systems within the environment. `Endpoints` serve as gateways for transmitting and receiving data, enabling seamless communication between `Nodes`.

!!!note "A `node` equipped with a set of `endpoints` resources might suffice as resources to model a fixed format entity. Conversely, modular systems often require the use of additional resources such as `NodeItems` and `ModuleBays`/`Module(s)` to accommodate their flexible configurations."

!!!note "We've opted for the name `endpoint` instead of `interface` as it better encompasses the scope we aim to cover. While 'interface' is often used in networking we opted for a more neutral term that can be used in different environments"

## Parameters

Domain (mandatory) 

Region (mandatory)

Site (mandatory)

Rack (optional)

Node (mandatory)

Interface (mandatory)

Speed (optional)

Module (optional)