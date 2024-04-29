# IPAM resource

The IP Address Management (IPAM) system comprises of multiple network instances, each housing nested prefixes to facilitate collaboration across teams and environments while maintaining a clear overview of IP usage. Each NetworkInstance manages IP resources, including IP prefixes and ranges, with the top prefix termed as an aggregated prefix. IP resources can be claimed statically or dynamically within a NetworkInstance, utilizing specified or unspecified IP addresses/prefixes. Overlapping IP resources are managed effectively by instantiating multiple network instances. IP resources are further subdivided using IP Prefixes and IP Ranges, with management facilitated through VLANClaim CRD. The system supports various IPClaim types, including static and dynamic allocations for prefixes, addresses, and ranges."





IPCLAIM types:
- static IP Prefix
- static IP Address
- static IP Range
- dynamic IP Prefix
- static IP Prefix

The below diagram show the hierarchy in which ip resources are managed.

```mermaid
---
title: VLAN index
---
flowchart TD
    i[NetworkInstance] --> a[IP Prefix Aggregate]
    a[IP Prefix Aggregate] --> pn[IP Prefix Network]
    a[IP Prefix Aggregate] --> pp[IP Prefix Pool]
    a[IP Prefix Aggregate] --> po[IP Prefix other]
    pn[IP Prefix Network]--> pnr[IP Range]
    pn[IP Prefix Network]--> pna[IP Address]
    pp[IP Prefix Pool]--> ppr[IP Range]
    pp[IP Prefix Pool] --> ppa[IP Address]
    po[IP Prefix Other] --> po[IP Prefix Other]
    po[IP Prefix Other] --> pn[IP Prefix Network]
    po[IP Prefix Other] --> pp[IP Prefix Pool]
    po[IP Prefix Other]--> por[IP Range]
    pnr[IP Range] --> pnra[IP Address]
    ppr[IP Range] --> ppra[IP Address]
    por[IP Range] --> pora[IP Address]
    
    
```

The IPAM resources are managed in a persistent storage and upon restart or reboot of the system the resources are restored.