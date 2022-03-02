# Login to Azure account.
Connect-AzAccount

# Set the subscription.
$context = Get-AzSubscription -SubscriptionName 'Azure Learning'
Set-AzContext $context

# Set default resource group.
Get-AzResourceGroup
Set-AzDefault -ResourceGroupName Shared-Resources

# Publish template as a template spec.
New-AzTemplateSpec `
  -ResourceGroupName Shared-Resources `
  -Name ToyCosmosDBAccount `
  -Location uksouth `
  -DisplayName 'Cosmos DB account' `
  -Description "This template spec creates a Cosmos DB account that meets our company's requirements." `
  -Version '1.0' `
  -TemplateFile azuredeploy.json

# Get the template spec version's resource id,
# Deploy the template spec.
$templateSpecVersionResourceId = (`
   Get-AzTemplateSpec `
      -ResourceGroupName Shared-Resources `
      -Name ToyCosmosDBAccount `
      -Version 1.0 `
).Versions[0].Id

New-AzResourceGroupDeployment -TemplateSpecId $templateSpecVersionResourceId

# Publish a new version of the template spec
New-AzTemplateSpec `
  -ResourceGroupName Shared-Resources `
  -Name ToyCosmosDBAccount `
  -Version '2.0' `
  -VersionDescription 'Adds Cosmos DB role-based access control.' `
  -TemplateFile azuredeploy.json
