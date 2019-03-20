$accessToken = $args[0];
$gitlabLink = $args[1];

"
What general labels do you want to add?
1 - Key general labels
2 - Standard general labels (includes key general labels)
3 - All general labels (includes standard and key general labels)
0 - None"
$labelSelection = Read-Host

IF (1, 2, 3 -contains $labelSelection) {
    .\general\key-list.ps1 $userToken $gitlabLink
} 
If (2, 3 -contains $labelSelection) {
    .\general\standard-list.ps1 $userToken $gitlabLink
} 
IF (3 -contains $labelSelection) {
    # .\general\extra-list.ps1 $userToken $gitlabLink
}