ps_replace
==========
PowerShell script to replace key words in a directory. This was specifically built to update strings for deploying a DotNetNuke site to multiple environments.

# Usage 
* Update the config with the appropriate values for your environment. 
* Right click the ps_replace.ps1 file and choose *Run with PowerShell*.    

# Config
The config schema looks like this: 
* **Current Environment:** The environment to use for replacing text.   
* **Environments:** A collection of environments
  * **Environment.name:** The name of the environment, to be used by the current environment element.  
    * **Folder:** The location of the files to replace text in.  
    * **Replacements:** A collection of replacements.  
      * **Replacement.find:** The word to look for in the text.  
      * **Replacement.replace:** The word to use as a replacement for what we're finding.  

# License
MIT License
