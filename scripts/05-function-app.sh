#!/bin/bash
source scripts/00-variables.sh

az functionapp create \
  --name "$FUNCTION_APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --storage-account "$STORAGE_ACCOUNT" \
  --plan "$APP_SERVICE_PLAN" \
  --runtime python \
  --runtime-version 3.11 \
  --functions-version 4

echo "URL Function App : https://$FUNCTION_APP_NAME.azurewebsites.net"
