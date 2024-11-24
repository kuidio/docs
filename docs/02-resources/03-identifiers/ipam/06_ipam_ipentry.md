# IP Entry

In Kuid, `IP Entries` represent the records stored in the backend system, providing insights into the state of the IPAM system. These entries are critical for troubleshooting and validating the proper functioning of the IPAM system.

Since `IP Entries` are managed as Kubernetes resources, they can be queried programmatically to assess system health, monitor resources, or perform specific tasks based on their contents.

!!! Note "Write access to the IP Entry resource must be prohibited to ensure the integrity of the system."

## Example Output

The following example output illustrates the structure and contents of IP Entries. These entries provide information about the index, claim type, prefix type, and the assigned IP address.

To retrieve the IP Entries, use the following command:

```
kubectl get ipentries.ipam.be.kuid.dev 
```

Example output:

```
NAME                                                 INDEX   CLAIMTYPE        PREFIXTYPE   PREFIX             DEFAULTGATEWAY
default.vpc1.10.0.0.0-24                             vpc1    staticPrefix     network      10.0.0.0/24        
default.vpc1.10.0.0.0-32                             vpc1    staticPrefix     network      10.0.0.0/32        
default.vpc1.10.0.0.0-8                              vpc1    staticPrefix     regular      10.0.0.0/8         
default.vpc1.10.0.0.1-32                             vpc1    staticPrefix     network      10.0.0.1/32        true
default.vpc1.10.0.0.10-31                            vpc1    staticRange      regular      10.0.0.10/31       
default.vpc1.10.0.0.12-30                            vpc1    staticRange      regular      10.0.0.12/30       
default.vpc1.10.0.0.16-30                            vpc1    staticRange      regular      10.0.0.16/30       
default.vpc1.10.0.0.2-32                             vpc1    staticAddress    network      10.0.0.2/32        
default.vpc1.10.0.0.254-32                           vpc1    dynamicAddress   network      10.0.0.254/32      
default.vpc1.10.0.0.255-32                           vpc1    staticPrefix     network      10.0.0.255/32      
default.vpc1.10.0.0.3-32                             vpc1    dynamicAddress   network      10.0.0.3/32        
default.vpc1.10.0.1.0-24                             vpc1    dynamicPrefix    network      10.0.1.0/24        
default.vpc1.10.0.1.0-32                             vpc1    dynamicPrefix    network      10.0.1.0/32        
default.vpc1.10.0.1.255-32                           vpc1    dynamicPrefix    network      10.0.1.255/32      
default.vpc1.172.0.0.0-16                            vpc1    staticPrefix     regular      172.0.0.0/16       
default.vpc1.172.0.0.0-8                             vpc1    staticPrefix     regular      172.0.0.0/8        
default.vpc1.172.0.199.196-32                        vpc1    dynamicAddress   regular      172.0.199.196/32   
default.vpc1.172.0.199.198-32                        vpc1    dynamicAddress   regular      172.0.199.198/32   
default.vpc1.172.0.199.199-32                        vpc1    staticAddress    regular      172.0.199.199/32   
default.vpc1.vpc1.10.0.0.10-10.0.0.19.10.0.0.10-32   vpc1    dynamicAddress   regular      10.0.0.10/32       
default.vpc1.vpc1.10.0.0.10-10.0.0.19.10.0.0.11-32   vpc1    dynamicAddress   regular      10.0.0.11/32      
```