$accessToken = $args[0];
$gitlabLink = $args[1];

"Add 'bug' label"
curl --data "name=bug&color=#FF0000" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"
"curl --data 'name=bug&color=#FF0000' --header 'PRIVATE-TOKEN: $accessToken' '$gitlabLink'"

"Add 'enhancement' label"
curl --data "name=enhancement&color=#D1D100" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"