#!/bin/bash
source scripts/00-variables.sh

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"
