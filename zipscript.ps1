$password = ""

$files = gci . *.* -rec | where { ! $_.PSIsContainer }
set-alias 7z "$env:ProgramFiles\7-Zip\7z.exe"
foreach ($file in $files) {
    $path = Get-Item -Path $file.PSPath #EXAMPLE: C:\batch\test_dir_2\test_dir_2_file_1.txt
    sz a -t7z -p$password "$path.7z" "$path" 
    rm $path
}
