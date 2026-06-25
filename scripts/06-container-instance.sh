#!/bin/bash

source scripts/00-variables.sh

az container create \
    --resource-group "$RESOURCE_GROUP" \
    --name "$ACI_NAME" \
    --image mcr.microsoft.com/azuredocs/aci-helloworld \
    --dns-name-label "$ACI_DNS_LABEL" \
    --ports 80 \
    --cpu 1 \
    --memory 1.5 \
    --os-type Linux \
    --location "$LOCATION"

echo "URL Container :"

az container show \
    --resource-group "$RESOURCE_GROUP" \
    --name "$ACI_NAME" \
    --query ipAddress.fqdn \
    --output tsv
