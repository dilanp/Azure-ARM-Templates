$projectName = "GitHubActionExercise"
$location = "eastus"
$resourceGroupName = "${projectName}-rg"
$appName = "http://${projectName}"

# Create the resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Store the resource group ID in a variable
$scope = Get-AzResourceGroup -Name $resourceGroupName -Location $location | Select-Object -Property ResourceId

# Create the service principal with contributor rights to the resource group we just created
New-AzADServicePrincipal -DisplayName $appName -Role Contributor -Scope $scope