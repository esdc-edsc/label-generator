# output with plain text - spacing matters
"
  ====================================================================================
  | Thank you for using ESDC Label Generator!                                        |
  | We need some information from you before we start adding labels to your project. |
  ====================================================================================
"

# variables
$gitPlatform
$curlLocation

# gather info

"
Where do you have curl.exe installed?
1- C:\Git\Git\mingw64\bin\curl.exe
2- C:\Windows\System32\curl\curl.exe
3- C:\Windows\SysWOW64\curl\curl.exe
4- C:\Program Files\Git\mingw64\bin\curl.exe
0- Other"
$curlSelector = Read-Host
IF ($curlSelector -eq 1) {
    $curlLocation = "C:\Git\Git\mingw64\bin\curl.exe"
} ElseIf ($curlSelector -eq 2) {
    $curlLocation = "C:\Windows\System32\curl\curl.exe"
} ElseIf ($curlSelector -eq 3) {
    $curlLocation = "C:\Windows\SysWOW64\curl\curl.exe"
} ElseIf ($curlSelector -eq 4) {
    $curlLocation = "C:\Program Files\Git\mingw64\bin\curl.exe"
} Else {
    $curlLocation = Read-Host -Prompt 'Please enter your curl location'
}
Remove-Item alias:curl
Set-Alias -Name curl -Value "$curlLocation"

$gitPlatform = ""
While ($gitPlatform -eq "") {
    "
    Which Git platform are you using?
    1- GitHub
    2- GitLab
    (Sorry, we don't support any other platforms at the moment.)"
    $gitPatformSelection = Read-Host
    
    IF ($gitPatformSelection -eq 1) {
        $gitPlatform = "hub"
        .\scripts\hub.ps1
    } ElseIf ($gitPatformSelection -eq 2) {
        $gitPlatform = "lab"
        .\scripts\lab.ps1
    } Else {
        "Sorry, you must select one of the options to continue."
    }    
}



"
  Thanks for using ESDC Labels!
"