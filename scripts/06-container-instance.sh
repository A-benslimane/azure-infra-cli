#!/bin/bash
source scripts/00-variables.sh

az container create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$ACI_NAME" \
  --image mcr.microsoft.com/azuredocs/aci-helloworld \
  --dns-name-label "$ACI_DNS_LABEL" \
  --ports 80 \
  --os-type Linux \
  --cpu 1 \
  --memory 1.5 \
  --location "$LOCATION"

az container show \
  --resource-group "$RESOURCE_GROUP" \
  --name "$ACI_NAME" \
  --query ipAddress.fqdn \
  --output tsv
