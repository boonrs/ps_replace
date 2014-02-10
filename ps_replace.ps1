
$path = "config.xml"
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
$relativePath = join-path -path $dir -childpath $path
Write-host "My directory is $relativePath"
$config = [xml](get-content $relativePath)