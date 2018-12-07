﻿<#
	.Authors
	Francesco Leonetti (LEF, francesco.leonetti@gorba.com)
	
	.Version
	0.1.0
	Created: 06.12.11 (LEF)
	Last updated: 07.128.11 (LEF)
	
	.Synopsis
	This script invokes other scripts to .
	
	.Remarks
	This script must run under .NET 4.0
	Change paths and version information in the 'Script variables' section
#>

param
(
	[string] $LocalServerInstance = ".",
	[switch] $UseLocalDatabase
)

#region Helper functions.

function GetScriptDirectory()
{
	$Invocation = (Get-Variable MyInvocation -Scope 1).Value
	Split-Path $Invocation.MyCommand.Path -Parent
}

#endregion

#region Script variables

New-Variable -Name ExportDatabase -Option ReadOnly -Scope Script -Value (Join-Path (GetScriptDirectory) "ExportDatabase.ps1")
New-Variable -Name DatabaseServer -Scope Script -Value "192.168.1.157"
New-Variable -Name DatabaseUser -Scope Script -Value "sa"
New-Variable -Name DatabaseName -Scope Script -Value "Gorba_CenterOnline"
#New-Variable -Name DatabaseVersion -Option ReadOnly -Scope Script -Value "1.0.1.6" # Change this! Comment to avoid version generation
New-Variable -Name DatabaseVersionDescription -Option ReadOnly -Scope Script -Value "Added association between units and stations. Added the network address to the units. Other improvements to tables and SPs." # Change this! Comment to avoid version generation
#New-Variable -Name DatabaseVersionDate -Option ReadOnly -Scope Script -Value "2011-12-07 10:10:00" # Change this! Comment to avoid version generation
New-Variable -Name TargetScriptPath -Option ReadOnly -Scope Script -Value (Join-Path (GetScriptDirectory) "../CreateScripts/CreateDatabase.sql") # Change this!

#endregion

if ($UseLocalDatabase)
{
	$DatabaseServer = $LocalServerInstance
}
else
{
	$DatabasePassword = Read-Host -AsSecureString "Please enter the password for the database"
}

& $ExportDatabase -DatabaseServer $DatabaseServer -DatabaseUser $DatabaseUser -DatabasePassword $DatabasePassword -DatabaseName $DatabaseName -TargetScriptPath $TargetScriptPath -DatabaseVersion $DatabaseVersion -DatabaseVersionDescription $DatabaseVersionDescription -DatabaseVersionDate $DatabaseVersionDate -UseLocalSecurity: $UseLocalDatabase