# Crafter CMS HA Deployment Automation

## Overview
The project automates the creation of a highly available environment running
[Crafter CMS 3.1.3](https://craftercms.org/).

By default the environment consists of 3 VMs spun up in VirtualBox via Vagrant
and provisioned using Ansible. The number of VMs is configurable (see
[Nodes Setup](#Nodes-Setup) section below).

For the demonstration purposes I have decided to run the automation locally
using Vagrant/VirtualBox/Ansible as these tools are Open Source, reliable and
free to use.

I expect the Ansible automation code to be reusable in other on-prem and Cloud
environments including AWS, GCP and Azure (please note, additional tools,
configuration and changes to the inventory file will be required).

This solution has been tested in an environment consisting of the following
tools:
- Elementary OS 5.0 Juno
- Vagrant 2.2.5
- VirtualBox 6.0.12
- Ansible 2.8.5
- GNU Make 4.1
- Git 2.17.1

## Nodes Setup
The first node is used as the central DB server and Load Balancer for Crafter
CMS Studio. All other nodes are provisioned as backend Crafter CMS servers.

Nodes deployed in the default 3-node scenario:
- node1: MariaDB and HAProxy ([Stats Page](http://192.168.69.11:81/), [Load Balanced CrafterCMS Studio](http://192.168.69.11/studio/))
- node2: [Crafter CMS](http://192.168.69.12:8080/studio/)
- node3: [Crafter CMS](http://192.168.69.13:8080/studio/)

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

## Prerequisites

## Deploy

## Rebuild

## Destroy

## Clean

## Notes

