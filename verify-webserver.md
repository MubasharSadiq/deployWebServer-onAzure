
# Find the resource group that contains the VM

`az vm list --query "[?name=='MyUbuntuWebServer'].resourceGroup" -o tsv`

# For obtain the public IP address of the VM  

- VM_NAME="MyUbuntuWebServer"  
- RESOURCE_GROUP=$(az vm list --query "[?name=='$VM_NAME'].resourceGroup" -o tsv)

# Now get the public IP of the VM using the found resource group

`az vm show -d --resource-group $RESOURCE_GROUP --name $VM_NAME --query publicIps -o tsv`

# SSH into the VM

## Use the public IP address obtained to SSH into the VM. The private SSH key will be located at   ~/.ssh/myUbuntuVM_id_rsa

`ssh -i ~/.ssh/id_rsa azureuser@<VM_Public_IP>`

# Verify Nginx Installation

`sudo systemctl status nginx`

# Test Nginx Default Page

`curl http://<VM_Public_IP>`

# For delete the resourceGroup

`az group delete --name <RESOURCE_GROUP_NAME> --yes --no-wait`
