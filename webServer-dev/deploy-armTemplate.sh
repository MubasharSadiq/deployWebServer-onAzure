#!/bin/bash

az group create --name armRG --location northeurope

az deployment group create \
--resource-group armRG \
--template-file armTemplate-webserver.json \
--parameters adminUsername=azureuser \
             adminPublicKey="$(cat ~/.ssh/id_rsa.pub)" \
             CustomData=@cloudinit-webserver.sh
