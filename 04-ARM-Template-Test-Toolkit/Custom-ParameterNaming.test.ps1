
# Create this INITIAL CONTENT in path first => path/to/arm-ttk/testcases/deploymentTemplate
<##################################################
param(
    [Parameter(Mandatory = $false, Position = 0)] #not mandatory for case of an empty resource array
    [PSObject]
    $MainTemplateResources
)
    
Write-Error "To be implemented"
####################################################>


<#
.Synopsis
 Ensures that all parameters adheres to a naming standard
.Description
 All parameters should start with the company specific prefix 'tailwind'
#>
param(
    # The Template Object
    [Parameter(Mandatory = $true, Position = 0)]
    [PSObject]
    $TemplateObject,

    # The Template JSON Text
    [Parameter(Mandatory = $true, Position = 0)]
    [PSObject]
    $TemplateText
)

foreach ($parameter in $TemplateObject.parameters.psobject.properties) {
    # If the parameter name starts with tailwind, then the parameter is correctly named
    if ($parameter.Name -notmatch 'tailwind*') {
        Write-Error "Parameter '$($parameter.Name)' must start with prefix 'tailwind'" -TargetObject $parameter
    }
}