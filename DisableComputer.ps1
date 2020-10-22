$comps= Get-Content -Path "PathToYourTextFileHere.txt"


foreach ($comp in $comps) {
$comp = get-adcomputer -identity $comp -properties * | select-object distinguishedname 
$comp = [string]$comp
$comp = $comp.trimstart("@{distinguishedname=")
$comp = $comp.trimend("}")
Set-ADObject -Identity:"$comp"-Replace:@{"userAccountControl"="4098"}
}
