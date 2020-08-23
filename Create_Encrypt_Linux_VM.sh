az login

az account show

az account list --all --output table

az account set --subscription "MSDN Platforms"

#Create a resource group
az group create --name "myResourceGroup" --location "westeurope"

#Create a virtual machine
az vm create --resource-group "myResourceGroup" --name "myVM" --image "Canonical:UbuntuServer:16.04-LTS:latest" --size "Standard_D2S_V3" --generate-ssh-keys

#Create a Key Vault configured for encryption keys
az keyvault create --name "tw-key-vault-1234567" --resource-group "myResourceGroup" --location "westeurope" --enabled-for-disk-encryption

#Encrypt the virtual machine
az vm encryption enable -g "MyResourceGroup" --name "myVM" --disk-encryption-keyvault "tw-key-vault-1234567"

az vm encryption show --name "myVM" -g "MyResourceGroup"

#Clean up resources
az group delete --name "myResourceGroup"