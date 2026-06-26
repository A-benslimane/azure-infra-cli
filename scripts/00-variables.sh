#!/bin/bash

export LOCATION="francecentral"
export RESOURCE_GROUP="${RESOURCE_GROUP:-abenslimaneRG}"

export STORAGE_ACCOUNT="stabdelcli6594"
export APP_SERVICE_PLAN="plan-abdel-cli"
export WEBAPP_NAME="api-appservice-abdel-4158"
export FUNCTION_APP_NAME="api-func-abdel-5013"

export ACI_NAME="api-aci-abdel"
export ACI_DNS_LABEL="api-aci-abdel-4158"

# Variables réseau

export OWNER="abdel-benslimane"
export RG="$RESOURCE_GROUP"

export TAGS="managed_by=cli environment=tp owner=${OWNER}"

export VNET_NAME="vnet-${OWNER}-cli"
export NSG_NAME="nsg-frontend-${OWNER}-cli"
export NIC_NAME="nic-test-${OWNER}-cli"
