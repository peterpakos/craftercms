# Crafter CMS HA Deployment Automation

## Overview
The project automates the creation of a highly available environment running
[Crafter CMS 3.1.3](https://craftercms.org/).

By default the environment consists of 3 VMs spun up in VirtualBox via Vagrant
and provisioned using Ansible. The number of instances in the cluster is
configurable (see [Detailed Setup Information](#Detailed-Setup-Information)
section below).

For the demonstration purposes I have decided to run the automation locally
using Vagrant/VirtualBox/Ansible as these tools are Open Source, reliable and
free to use.

I expect the Ansible automation code to be reusable in other on-prem and Cloud
environments including AWS, GCP and Azure (please note, additional tools,
configuration and suitable inventory file will be required).

The solution has been tested in an environment which had the following tools
installed:
- Elementary OS 5.0 Juno
- Vagrant 2.2.5
- VirtualBox 6.0.12
- Ansible 2.8.5
- GNU Make 4.1
- GNU Wget 1.19.4
- Git 2.17.1

## Detailed Setup Information
The first node in the cluster is used as the central DB server and Load
Balancer for Crafter CMS Studio. The remaining nodes are provisioned as backend
Crafter CMS servers.

List of nodes deployed in the default 3-nodes scenario:
- node1: MariaDB and HAProxy ([Stats Page](http://192.168.69.11:81/),
[Load Balanced CrafterCMS Studio](http://192.168.69.11/studio/))
- node2: [Crafter CMS](http://192.168.69.12:8080/studio/)
- node3: [Crafter CMS](http://192.168.69.13:8080/studio/)

## Scaling up and out
By default the project uses 3 nodes, each with 2 vCores and 4GB RAM. It can be
scaled both vertically and horizontally.

### Horizontal scaling
The number of nodes in the cluster can be selected by setting the environment
variable `N` when deploying/scaling the environment:
```
N=4 make deploy
N=4 make destroy
```
or
```
export N=4
make deploy
make destroy
```
When you run `N=x make deploy` where `x` is higher than current number of nodes
in the cluster, new node/nodes will be deployed and Ansible provisioning will
be run against all nodes in the cluster.

### Vertical scaling
In order to adjust number of CPU cores and RAM (in MBs) assigned to each VM,
set environment variables `CPU` and `RAM` when creating the environment:
```
CPU=4 RAM=8192 make deploy
```

If you want to scale the instances up after the deployment, the instances will
have to be reloaded. Run:
```
CPU=4 RAM=8192 make reload
```

## Prerequisites
Before starting the deployment, please make sure enough resources are available
on the host machine and the latest version of the following tools is installed: 
- Vagrant
- VirtualBox
- Ansible
- Make
- Wget
- Git

In order to clone the repository to a local machine, run:
```
git clone https://github.com/peterpakos/craftercms.git
cd craftercms/
```

## Deploy
To create and provision new environment, run:
```
make deploy
```

## Provision
If you have made any changes to the Ansible automation codebase and wish to run
the Ansible playbook to deploy these changes, run:
```
make provision
```

## Rebuild
To rebuild the existing environment, run:
```
make rebuild
```

## Destroy
To destroy the environment, run:
```
make destroy
```

## Clean
To clean up after finished deployment, run:
```
make clean
```
Please note, this command destroys the environment and deletes any downloaded
files.

## Screenshots
[HAProxy Stats Page](http://192.168.69.11:81/):
![HAProxy Stats Screenshot](screenshots/haproxy.png)

A test site in the [Load Balanced CrafterCMS Studio](http://192.168.69.11/studio/):
![Load Balanced CrafterCMS Studio Screenshot](screenshots/testsite.png)

## Notes
