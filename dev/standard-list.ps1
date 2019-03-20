$accessToken = $args[0];
$gitlabLink = $args[1];

"
Add 'configuration' label"
curl --data "name=configuration&color=#A295D6&description=This issue deals with configuration" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"

"
Add 'deployment' label"
curl --data "name=deployment&color=#8E44AD&description=This issue has to do with a deployment" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"

"
Add 'maintance' label"
curl --data "name=maintance&color=#fef2c0&description=General maintance (avoid using)" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"

"
Add 'tests' label"
curl --data "name=tests&color=#f9d0c4&description=Issue deals with integrated or automated tests" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"

"
Add 'pipeline' label"
curl --data "name=pipeline&color=#d4c5f9&description=Work related to the pipeline" --header "PRIVATE-TOKEN: $accessToken" "$gitlabLink"