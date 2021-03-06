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

# Loop through all files and do the replacements
foreach($file in Get-ChildItem $folder)
{
    $filePath = join-path -path $folder -childpath $file
    
     # Not efficient, refactor 
     foreach ($rep in $node.replacements.replacement) {
        (Get-Content $filePath) | Foreach-Object {
            $_ -replace $rep.find, $rep.replace
        }| Set-Content $filePath
     }
}


