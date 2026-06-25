#!/bin/bash

source scripts/00-variables.sh

echo "Création du plan App Service..."

az appservice plan create \
    --name "$APP_SERVICE_PLAN" \
    --resource-group "$RESOURCE_GROUP" \
    --location "$LOCATION" \
    --sku B1 \
    --is-linux

echo "Création de la Web App..."

az webapp create \
    --name "$WEBAPP_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --plan "$APP_SERVICE_PLAN" \
    --runtime "PHP:8.2"

echo "URL App Service : https://$WEBAPP_NAME.azurewebsites.net"
