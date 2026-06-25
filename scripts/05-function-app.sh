#!/bin/bash

source scripts/00-variables.sh

az functionapp create \
    --resource-group "$RESOURCE_GROUP" \
    --consumption-plan-location "$LOCATION" \
    --runtime python \
    --runtime-version 3.11 \
    --functions-version 4 \
    --os-type Linux \
    --name "$FUNCTION_APP_NAME" \
    --storage-account "$STORAGE_ACCOUNT"

echo "URL Function App : https://$FUNCTION_APP_NAME.azurewebsites.net"
