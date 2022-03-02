# Connect to the Azure account.
Connect-AzAccount
# Get subscription in the account
Get-AzSubscription
# Pick the desired subscription to be used.
$context = Get-AzSubscription -SubscriptionId 'subscription-id'
# Set the desired subscription picked above.
Set-AzContext $context
# Set the default subscription to be used going forward.
Set-AzDefault -ResourceGroupName 'resource group name to be used as default'

# Deployment with inline parameter passing.
$deploymentName = "the-unique-deployment-name"
$templateFile = "azuredeploy.json"

New-AzResourceGroupDeployment `
    -Name $deploymentName `
    -TemplateFile $templateFile `
    -storagePrefix "dpsa" `
    -storageSKU Standard_LRS # Parameter values.

# Specify parameters file and use it to create deployment.
$parameterFile = "azuredeploy.parameters.dev.json"

New-AzResourceGroupDeployment `
    -Name $deploymentName `
    -TemplateFile $templateFile `
    -TemplateParameterFile $parameterFile

# Confirm changes you are about to make using what-if analysis.
New-AzResourceGroupDeployment `
    -TemplateFile $templateFileName `
    -WhatIf `
    -WhatIfResultFormat FullResourcePayloads # ResourceIdOnly

# Deploy with complete mode and confirmation options.
New-AzResourceGroupDeployment `
    -TemplateFile azuredeploy.json `
    -Confirm `
    -Mode Complete ` # Incremental
