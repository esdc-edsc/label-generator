$accessToken = $args[0];
$gitlabLink = $args[1];

"
Add 'bug' label"
curl --data "name=bug&color=#FF0000&description=Something isn't working" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"

"
Add 'enhancement' label"
curl --data "name=enhancement&color=#D1D100&description=New feature or request" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"