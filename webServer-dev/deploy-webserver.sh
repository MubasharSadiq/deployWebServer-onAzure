#!/bin/bash

# Variables
RESOURCE_GROUP="webserverRG"                         # Resource Group 
LOCATION="northeurope"                               # Azure region (location)
VM_NAME="MyUbuntuWebServer"                          # Name of the VM 
VM_SIZE="Standard_B1ls"                              # Size of the VM (Standard_B1ls)
IMAGE="Ubuntu2204"                                   # OS image (Ubuntu 22.04 LTS)
ADMIN_USERNAME="mobi"                                # Admin username for the VM

# Don't forget to az login 

# Step 1: Here we will create the Resource Group
echo "Creating resource group: $RESOURCE_GROUP in $LOCATION"
az group create --name $RESOURCE_GROUP --location $LOCATION 

# Step 2: Now, we will create the VM with Cloudinit script 
echo "Creating virtual machine: $VM_NAME..."
az vm create \
    --resource-group $RESOURCE_GROUP \
    --name $VM_NAME \
    --location $LOCATION \
    --image $IMAGE \
    --size $VM_SIZE \
    --admin-username $ADMIN_USERNAME \
    --generate-ssh-keys \
    --custom-data @cloudinit-webserver.sh

# Step 4: Here we open Port 80 for Web Traffic
echo "Opening port 80 for HTTP traffic"
az vm open-port --resource-group $RESOURCE_GROUP --name $VM_NAME --port 80

# Final message
echo "Deployment complete!