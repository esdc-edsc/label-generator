$accessToken = $args[0];
$gitlabLink = $args[1];
$jsonFile = $args[2];

$labelData = (Get-Content $jsonFile | Out-String | ConvertFrom-Json)

Foreach ($label in $labelData)
{
    $name = $label.name
    $color = $label.color
    $desc = $label.desc
    # # For debuging
    # Write-Host "Name: $name; Color: $color; Description: $desc;"
    
    "
    Add '$name' label"
    curl --data "name=$name&color=$color&description=$desc" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"
}
