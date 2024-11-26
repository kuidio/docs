# IPAM 

Kuid implements a robust IPAM system that supports both IPv4 and IPv6 addresses. It utilizes multiple routing tables or indices to enable Virtual Routing and Forwarding (VRF) and manage environments with overlapping IP address spaces.

## IP Index

An `IPIndex` in Kuid acts as a container for both IPv4 and IPv6 addresses, offering flexible management by associating with specific teams, VRFs, or other entities. This organizational structure allows for fine-grained control and segmentation of IP resources across various contexts.

The `IPIndex` supports hierarchical definitions, including IP Prefixes, Ranges, and/or Addresses, which allows for scalable and organized management of IP resources.

## IP Prefix

An IP Prefix represents a range of IP addresses registered within the IP Index. These prefixes can be nested according to CIDR notation, allowing for efficient address allocation and management. Kuid supports two types of IP prefixes:

Network Prefixes: 

  - Used for device interfaces with physical or virtual NICs. 
  - Network and broadcast addresses are pre-allocated in the IPAM backend (except for IPv4 /31 and IPv6 /127 prefixes).
  - Cannot be nested

Regular Prefixes: 

  - Used for IP prefix hierarchies, IP pools, etc. 
  - Network and broadcast addresses are NOT pre-allocated in the IPAM backend.
  - Can be nested

## IP Range

An IP Range defines a continuous block of IP addresses within an IP Prefix, allowing for efficient assignment and management of IP addresses within a defined range. This is useful for allocating addresses to devices or services within a specific scope while maintaining control over address distribution.

## IP Address

An IP Address refers to a specific individual address within an IP Range or Prefix, assigned to a particular resource or endpoint. The system ensures that each address is unique within its assigned context and can be dynamically or statically allocated as needed

## Data Model

The below diagram show the hierarchy in which IP resources are managed within an IP Index.


```mermaid
---
title: IPAM index
---
flowchart TD
    i[IP Index] --> pp[IP Prefix]
    i[IP Index] --> pn[IP Prefix Network]
    pp[IP Prefix] --> |1:N| pp[IP Prefix]
    pp[IP Prefix] --> |1:N| ppr[IP Range]
    pp[IP Prefix] --> pn[IP Prefix Network]
    pn[IP Prefix Network]--> |1:N| pnr[IP Range]
    pn[IP Prefix  Network]--> |1:N| pna[IP Address]
    pp[IP Prefix] --> |1:N| ppa[IP Address]
    pnr[IP Range] --> |1:N| pnra[IP Address]
    ppr[IP Range] --> |1:N| ppra[IP Address]
```

IPAM resources are stored persistently, and upon system restart or reboot, all resources are automatically restored.
