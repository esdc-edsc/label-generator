# variables
$githubEnv
$orgUser
$repo
$userToken

"
Which GitHub enviornment are you using? 
1- GitHub.com
0- Other"
$githubEnvSelection = Read-Host

IF ($githubEnvSelection -eq 1) {
    $githubEnv = "github.com"
} Else {
    $githubEnv = Read-Host -Prompt 'Please enter your GitHub enviornment.'
}

"
You have chosen to use 'https://$githubEnv/' as your enviornment for git.
"

$orgUser = Read-Host -Prompt 'What is the name (url portion) of the organization or user for the repository?'
$repo = Read-Host -Prompt 'What is the name (url portion) of the repository?'
$userToken = Read-Host -Prompt 'What is your GitHub API User Token?'

## select and add labels
.\scripts\select.ps1 $userToken "https://api.$githubEnv/repos/$orgUser/$repo/labels" "hub"