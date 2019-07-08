# variables
$gitlabEnv
$GorP
$projectId
$userToken

"
Which GitLab enviornment are you using? 
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
You have chosen to use 'https://$gitlabEnv/' as your enviornment for git.
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

$userToken = Read-Host -Prompt 'What is your GitLab API User Token?'

## select and add labels
.\scripts\select.ps1 $userToken "https://$gitlabEnv/api/v4/$GorP/$projectId/labels" "lab"