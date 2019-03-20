$accessToken = $args[0];
$gitlabLink = $args[1];

"
Add 'documentation' label"
curl --data "name=documentation&color=#FFECDB&description=Deals with documentation changes" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"

"
Add 'duplicate' label"
curl --data "name=duplicate&color=#cfd3d7&description=This issue or merge request already exists" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"

"
Add 'translation' label"
curl --data "name=translation&color=#e99695&description=Something needs to be translated" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"