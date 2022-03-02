projectName="GitHubActionExercise"
location="eastus"
resourceGroupName="${projectName}-rg"
appName="http://${projectName}"

# Create the resource group
az group create --name $resourceGroupName --location $location

# Store the resource group ID in a variable
scope=$(az group list --query "[?contains(name, '$resourceGroupName')].id" -o tsv)

# Create the service principal with contributor rights to the resource group we just created
az ad sp create-for-rbac --name $appName --role Contributor --scopes $scope --sdk-auth