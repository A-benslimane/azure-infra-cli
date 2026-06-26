#!/bin/bash
set -e

source scripts/00-variables.sh

echo "Création du VNet..."
az network vnet create \
  --name "$VNET_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --address-prefix "10.0.0.0/16" \
  --tags $TAGS

echo "Création du subnet frontend..."
az network vnet subnet create \
  --name "subnet-frontend" \
  --vnet-name "$VNET_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --address-prefix "10.0.1.0/24"

echo "Création du subnet backend..."
az network vnet subnet create \
  --name "subnet-backend" \
  --vnet-name "$VNET_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --address-prefix "10.0.2.0/24"

echo "Création du NSG..."
az network nsg create \
  --name "$NSG_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --tags $TAGS

echo "Autoriser HTTP..."
az network nsg rule create \
  --name "Allow-HTTP" \
  --nsg-name "$NSG_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --priority 100 \
  --direction Inbound \
  --access Allow \
  --protocol Tcp \
  --source-address-prefix "*" \
  --source-port-range "*" \
  --destination-address-prefix "*" \
  --destination-port-range "80"

echo "Autoriser HTTPS..."
az network nsg rule create \
  --name "Allow-HTTPS" \
  --nsg-name "$NSG_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --priority 110 \
  --direction Inbound \
  --access Allow \
  --protocol Tcp \
  --source-address-prefix "*" \
  --source-port-range "*" \
  --destination-address-prefix "*" \
  --destination-port-range "443"

echo "Bloquer tout autre trafic entrant..."
az network nsg rule create \
  --name "Deny-All-Inbound" \
  --nsg-name "$NSG_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --priority 4000 \
  --direction Inbound \
  --access Deny \
  --protocol "*" \
  --source-address-prefix "*" \
  --source-port-range "*" \
  --destination-address-prefix "*" \
  --destination-port-range "*"

echo "Associer le NSG au subnet frontend..."
az network vnet subnet update \
  --name "subnet-frontend" \
  --vnet-name "$VNET_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --network-security-group "$NSG_NAME"

echo "Créer une NIC de test..."
az network nic create \
  --name "$NIC_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --vnet-name "$VNET_NAME" \
  --subnet "subnet-frontend" \
  --tags $TAGS

echo "Vérification des subnets..."
az network vnet subnet list \
  --vnet-name "$VNET_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --query "[].{Nom:name, Plage:addressPrefix, NSG:networkSecurityGroup.id}" \
  --output table

echo "Vérification des règles NSG..."
az network nsg rule list \
  --nsg-name "$NSG_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --query "[].{Nom:name, Priorite:priority, Direction:direction, Action:access, Port:destinationPortRange}" \
  --output table

echo "Réseau Azure créé avec succès."
