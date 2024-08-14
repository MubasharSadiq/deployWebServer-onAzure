#!/bin/bash

# Variables
RESOURCE_GROUP="webserverRG-$(openssl rand -hex 2)"  # Unique Resource Group name with a random hex suffix
LOCATION="northeurope"                               # Azure region (location)
VM_NAME="MyUbuntuWebServer"                          # Name of the VM to be created
VM_SIZE="Standard_B1ls"                              # Size of the VM (Standard_B1ls is a low-cost option)
IMAGE="Ubuntu2204"                                   # OS image (Ubuntu 22.04 LTS)
ADMIN_USERNAME="azureuser"                           # Admin username for the VM

# Step 1: Log in to Azure (only if not already logged in)
# echo "Logging in to Azure..."
# az login

# Step 2: Create the Resource Group
echo "Creating resource group: $RESOURCE_GROUP in $LOCATION..."
az group create --name $RESOURCE_GROUP --location $LOCATION 

# Step 3: Create the VM with Cloud-Init
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

# Step 4: Open Port 80 for Web Traffic
echo "Opening port 80 for HTTP traffic..."
az vm open-port --resource-group $RESOURCE_GROUP --name $VM_NAME --port 80

# Final message
echo "Deployment complete! Your web server is up and running. Check the Azure portal for the public IP address."
