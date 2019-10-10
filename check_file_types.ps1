$7z_files = (gci . *.7z* -rec | where { ! $_.PSIsContainer } | Measure-Object).Count;
$other_files = (gci . *.* -rec -exclude *.7z | where { ! $_.PSIsContainer } | Measure-Object).Count;

Write-Output "7Z Files: $7z_files | Other Files: $other_files"
if ([int]$other_files -gt 0) {
    $other_files = gci . *.* -rec -exclude *.7z | where { ! $_.PSIsContainer }
    Write-Output "Other files:"
    foreach ($other_file in $other_files) {
        $path = Get-Item -Path $other_file.PSPath
        Write-Output "$other_file"
    }
}
