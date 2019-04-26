#!/bin/bash

AKS_RESOURCE_GROUP=myAKSResourceGroup
AKS_CLUSTER_NAME=dev24aks
ACR_RESOURCE_GROUP=myACRResourceGroup
ACR_NAME=dev24cr

echo "Creating ACR"
az group create --name $ACR_RESOURCE_GROUP --location westeurope

az acr create --resource-group $ACR_RESOURCE_GROUP --name $ACR_NAME --sku Basic

echo "Creating AKS"
az group create --name $AKS_RESOURCE_GROUP --location westeurope

az aks create --resource-group $AKS_RESOURCE_GROUP \
    --name $AKS_CLUSTER_NAME \
    --node-count 2 \
    --enable-addons monitoring \
    --generate-ssh-keys

echo "Connecting AKS and ACR"
# Get the id of the service principal configured for AKS
CLIENT_ID=$(az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --query "servicePrincipalProfile.clientId" --output tsv)

# Get the ACR registry resource id
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)

# Create role assignment
az role assignment create --assignee $CLIENT_ID --role acrpull --scope $ACR_ID