$path = "config.xml"

# Load the XML File
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
$absolutePath = join-path -path $dir -childpath $path
$config = [xml](get-content $absolutePath)

# Get the environment
$environment = $config.configuration.currentEnvironment

# Get the location of files to parse
$node = $config.configuration.environments.environment | ? {$environment -eq $_.name}
$folder = $node | Select-XML folder
foreach ($ns in $node.replacements.replacement) {
    Write-host $ns.find
    Write-host $ns.replace
}

# Loop through all files
foreach($file in Get-ChildItem $folder)
{
    $filePath = join-path -path $folder -childpath $file
    # Processing code goes here
    Write-host $filePath
}