# arcadia finance demo app

F5 arcadia finance demo app used from https://gitlab.com/arcadia-application

## Diagram
```  
                                                  +--- vspher1 ----+
+---------------+       +-----------------+   ------> app3 backend |
|               |       |                 |  /    +----------------+
|            .------------>  op app3 --------
|           /   |       |                 |  \    +--- vsphere2 ---+
|          /    |       +---- on-prem ----+   ------> app3 backend |
|         /     |                                 +----------------+
|        /      |       +--- aws tgw1 ----+       +--- aws tgw2 ---+
|      lb       |       |                 |       |                |
|     public --------------> op mainapp   |       |                |
|      vip      |       |   lb backend --------------> op backend  |
|         \     |       |                 |       |                |
|          \    |       +--- us-west-2 ---+       +-- us-east-1 ---+
|           \   |       
|            \  |       +-- azure vnet1 --+
|      F5     \ |       |                 |
| Distributed  `-----------> op app2      |
| Cloud Service |       |                 |
+---------------+       +---- westus2 ----+
```

Application is exposed via public vip on delegated domain at 
https://arcadia.acmecorp-prod.f5xc.app (login matt/ilovef5)

## Microservices distribution

| service     | site        | comments                                                           |
|-------------|-------------|--------------------------------------------------------------------|
| mainapp     | aws tgw1    | origin pool exposed via public vip load balancer to all F5 XC RE's |
| backend     | aws tgw2    | origin pool exposed via load balancer on aws tgw1                  |
| app2        | azure vnet1 | routed from public vip load balancer to origin pool on vnet1       |
| app3        | vsphere1/2  | routed from public vip load balancer to origin pool on vsphere1&2  |

The microservices are deployed in virtual machines using docker/podman and connected to workload subnets 
in spoke VPC/VNETs. Fedora Core OS is used for instances in AWS and Ubuntu in Azure (because there are 
still no official FCOS image available in Azure marketplace).

