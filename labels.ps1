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
$gitlabLink
$curlLocation
$addMore = "n"

# gather info

"Where do you have curl.exe installed?
1- C:\Git\Git\mingw64\bin\curl.exe
2- C:\Windows\System32\curl\curl.exe
3- C:\Windows\SysWOW64\curl\curl.exe
4- Other"
$curlSelector = Read-Host
IF ($curlSelector -eq 1) {
    $curlLocation = "C:\Git\Git\mingw64\bin\curl.exe"
} ElseIf ($curlSelector -eq 2) {
    $curlLocation = "C:\Windows\System32\curl\curl.exe"
} ElseIf ($curlSelector -eq 3) {
    $curlLocation = "C:\Windows\SysWOW64\curl\curl.exe"
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
"In order to add labels to your project we will need some info about the project you want to add the labels to."
$projectId = Read-Host -Prompt 'What is the Project ID?'
$userToken = Read-Host -Prompt 'What is your User Token?'


$gitlabLink = "https://$gitlabEnv/api/v4/projects/$projectId/labels"

# add different sets of labels
do {
"
What types of labels do you want to add to your project?
1 - Key labels from all types
2 - Dev labels
3 - A11Y labels
4 - Security labels
0 - Gerneral labels"
$labelSelection = Read-Host

IF ($labelSelection -eq 0) {
    .\general\start.ps1 $userToken $gitlabLink
} ElseIF ($labelSelection -eq 1) {
    .\dev\key-list.ps1 $userToken $gitlabLink
    .\general\key-list.ps1 $userToken $gitlabLink
} ElseIf ($labelSelection -eq 2) {
    .\dev\start.ps1 $userToken $gitlabLink 
} Else {
    "This option is not avaliable yet."
}

" 
  ---- done ----
" #line break
# check for exit
$addMore = Read-Host -Prompt 'Would you like to add more labels (Y/n)?'
} While ($addMore -like "y")


"
  Thanks for using ESDC Labels!
"