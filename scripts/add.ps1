$hublab = $args[0];
$accessToken = $args[1];
$gitLink = $args[2];
$jsonFile = $args[3];

$labelData = (Get-Content $jsonFile | Out-String | ConvertFrom-Json)

Foreach ($label in $labelData) {
    $name = $label.name
    $color = $label.color
    $desc = $label.desc
    # # For debuging
    # Write-Host "Name: $name; Color: $color; Description: $desc;"
    
    "
    Add '$name' label"

    If ($hublab -eq "lab") {
        curl --data "name=$name&color=$color&description=$desc" --header "PRIVATE-TOKEN: $accessToken" "$gitLink"        
    } Else {
        $user = $accessToken + ":x-oauth-basic"
        $color = $color -replace '#',''

        curl -u $user --data "{\""name\"":\""$name\"",\""color\"":\""$color\""}" $gitLink
    }
}