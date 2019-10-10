$password = ""

$files = gci . *.* -rec | where { ! $_.PSIsContainer }
set-alias 7z "$env:ProgramFiles\7-Zip\7z.exe"

$files_processed = 0
foreach ($file in $files) {
    $path = Get-Item -Path $file.PSPath
    Write-Output "Archiving path: $path | file: $file | password: $password"
    7z a -t7z "$path.7z" "$path" -p"$password"
    rm $path
    $files_processed++
}

Write-Output "Files processed: $files_processed"
