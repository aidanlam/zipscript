$password = ""

$files = gci . *.* -rec | where { ! $_.PSIsContainer }
set-alias 7z "$env:ProgramFiles\7-Zip\7z.exe"

foreach ($file in $files) {
    $path = Get-Item -Path $file.PSPath
    echo "Archiving path: $path | file: $file | password: $password"
    7z a -t7z "$path.7z" "$path" -p"$password"
    rm $path
}
