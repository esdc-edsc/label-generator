$accessToken = $args[0];
$gitlabLink = $args[1];

"
What development labels do you want to add?
1 - Key dev labels
2 - Standard dev labels (includes key dev labels)
3 - All dev labels (includes standard and key dev labels)
0 - None"
$labelSelection = Read-Host

IF (1, 2, 3 -contains $labelSelection) {
    .\dev\key-list.ps1 $userToken $gitlabLink
} 
If (2, 3 -contains $labelSelection) {
    "Standard list not avaliable yet"
    # .\dev\standard-list.ps1 $userToken $gitlabLink
} 
IF (3 -contains $labelSelection) {
    # .\dev\extra-list.ps1 $userToken $gitlabLink
}