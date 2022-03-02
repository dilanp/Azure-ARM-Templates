# Connect to the Azure account.
az login
# Pick the id of desired subscription to be used.
az account list \
   --refresh \
   --query "[?contains(name, 'Subscription Name')].id" \
   --output table
# Set the desired subscription picked above.
az account set --subscription 'subscription-id'
# Set the default subscription to be used going forward.
az configure --defaults group=learn-b5962c36-d722-4253-aa2f-1caa26e4fc44

# Deployment with inline parameter passing.
az deployment group create \
    --template-file azuredeploy.json

# Specify parameters file and use it to create deployment.
$parameterFile = "azuredeploy.parameters.dev.json"


# Confirm changes you are about to make using what-if analysis.
az deployment group what-if \
  --template-file azuredeploy.json

# Deploy with complete mode and confirmation options.
az deployment group create \
  --mode Complete \
  --confirm-with-what-if \
  --template-file azuredeploy.json

