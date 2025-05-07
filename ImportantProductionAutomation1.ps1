Import-Module PokeDexAPI
Import-Module dbatools

$sqlParams = Import-PowerShellDataFile $PSScriptRoot\sqlParams.psd1
# This script retrieves Pokémon data from the PokeDex API and stores it in a variable.
$Gen1Pokemon = 1..151 | ForEach-Object{get-pokeDexPokemon -slug $_}

$gen1Pokemon | Write-DbaDbTableData @sqlParams -AutoCreateTable