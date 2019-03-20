$accessToken = $args[0];
$gitlabLink = $args[1];

"
Add 'question' label"
curl --data "name=question&color=#d876e3&description=Further information is requested" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"

"
Add 'wontfix' label"
curl --data "name=wontfix&color=#ffffff&description=This will not be worked on" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"