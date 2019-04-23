# output with plain text - spacing matters
"
  ====================================================================================
  | Thank you for using ESDC Labels!                                                 |
  | We need some information from you before we start adding labels to your project. |
  ====================================================================================
"

# variables
$gitlabEnv
$projectId
$userToken
$curlLocation
$GorP

# gather info

"Where do you have curl.exe installed?
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

"Which GitLab enviornment are you using? 
1- GCCode
2- GitLab.com
0- Other"
$gitlabEnvSelection = Read-Host

IF ($gitlabEnvSelection -eq 1) {
    $gitlabEnv = "gccode.ssc-spc.gc.ca"
} ElseIf ($gitlabEnvSelection -eq 2) {
    $gitlabEnv = "gitlab.com"
} Else {
    $gitlabEnv = Read-Host -Prompt 'Please enter your GitLab enviornment.'
}

"
You have chosen to use 'https://$gitlabEnv/' as your enviornment for gitlab.
"
"In order to add labels to your project we will need some info about the project or group you want to add the labels to."

$GorP = Read-Host -Prompt 'Are you targeting a Group (G) or Project (p) for these labels?  (enter G or p)'

IF ($GorP -eq "G") {
    $GorP = "groups"
    $projectId = Read-Host -Prompt 'What is the Group ID?'
} Else {
    $GorP = "projects"
    $projectId = Read-Host -Prompt 'What is the Project ID?'
}

$userToken = Read-Host -Prompt 'What is your User Token?'

## select and add labels
.\scripts\select.ps1 $userToken "https://$gitlabEnv/api/v4/$GorP/$projectId/labels"

"
  Thanks for using ESDC Labels!
"