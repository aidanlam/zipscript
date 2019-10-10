$password = "password"

$files = gci . *.* -rec | where { ! $_.PSIsContainer }
set-alias 7z "$env:ProgramFiles\7-Zip\7z.exe"

$files_processed = 0
foreach ($file in $files) {
    $path = Get-Item -Path $file.PSPath
    echo "Archiving path: $path | file: $file | password: $password"
    7z a -t7z "$path.7z" "$path" -p"$password"
    rm $path
    $files_processed++
}

$7z_files = (gci . *.7z* -rec | where { ! $_.PSIsContainer } | Measure-Object).Count;
$other_files = (gci . *.* -rec -exclude *.7z | where { ! $_.PSIsContainer } | Measure-Object).Count;

echo "Files processed: $files_processed | 7z files: $7z_files | Other files: $other_files"
