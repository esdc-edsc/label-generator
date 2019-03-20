$accessToken = $args[0];
$gitlabLink = $args[1];

"
Add 'feature request' label"
curl --data "name=feature request&color=#AD8D43&description=Specifically a request for a new feature" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"