# Make sure PowerShell is installed locally.

# Run commands to verify the installation.
pwsh # (Mac/Linux only)
$PSVersionTable

# Download the Test toolkit from github.
git clone https://github.com/Azure/arm-ttk.git

# Inspect the test cloned toolkit directory structure.

# Import the module from local repository.
Import-Module path/to/arm-ttk/arm-ttk.psd1 # Mac/Linuc
Import-Module path\to\arm-ttk\arm-ttk.psd1 # Windows

# Move to the template path and run.
Test-AzTemplate -TemplatePath .

# ========= CUSTOM TESTS============
# Move Custom-ParameterNaming.test.ps1 with "INITIAL CONTENT" inside it
# into path/to/arm-ttk/testcases/deploymentTemplate
# Run test and make sure you see custom test step error message.
# Now this custom tests are enabled with other tests of the framework.
# We can now add required custom tests into Custom-ParameterNaming.test.ps1
Test-AzTemplate -TemplatePath .

# We can also run a specific custom test using -Test parameter.
Test-AzTemplate -TemplatePath . -Test Custom-ParameterNaming