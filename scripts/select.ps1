$userToken = $args[0];
$gitlabLink = $args[1];
$hublab = $args[2];

$addMore = "n"

# add different sets of labels
do {
    "
    What types of labels do you want to add to your project?
    0 - Key labels from all types
    1 - General labels
    2 - Dev labels
    3 - Priority labels
    (In development: A11Y labels, Security labels)"
    $selection = Read-Host
    
    IF ($selection -eq 0) {
        .\scripts\add.ps1 $hublab $userToken $gitlabLink ".\dev\key-list.json"
        .\scripts\add.ps1 $hublab $userToken $gitlabLink ".\general\key-list.json"
        .\scripts\add.ps1 $hublab $userToken $gitlabLink ".\priority\key-list.json"
    } ElseIF ($selection -In 1..3) {
        $selectedType
        IF ($selection -eq 1) {
            $selectedType = "general"
        } ElseIf ($selection -eq 2) {
            $selectedType = "dev"
        } ElseIf ($selection -eq 3) {
            $selectedType = "priority"
        } 
        
        "
        What $selectedType labels do you want to add?
        1 - Key $selectedType labels
        2 - Standard $selectedType labels (includes key $selectedType labels)
        3 - All $selectedType labels (includes standard and key $selectedType labels)
        0 - None"
        $levelSelection = Read-Host

        IF (1, 2, 3 -contains $levelSelection) {
            .\scripts\add.ps1 $hublab $userToken $gitlabLink ".\$selectedType\key-list.json"
        } 
        If (2, 3 -contains $levelSelection) {
            .\scripts\add.ps1 $hublab $userToken $gitlabLink ".\$selectedType\standard-list.json"
        } 
        IF (3 -contains $levelSelection) {
            .\scripts\add.ps1 $hublab $userToken $gitlabLink ".\$selectedType\extra-list.json"
        }
    } Else {
        "This option is not avaliable yet."
    }
    
    " 
      ---- done ----
    " #line break
    # check for exit
    $addMore = Read-Host -Prompt 'Would you like to add more labels (Y/n)?'
} While ($addMore -like "y")