# ESDC Label Generator

**Get your projects default labels set up quickly with ease with this project!**

This project identifies groups of labels that are common to almost every project.
Providing scripts to connect to GitLab or GitHubs APIs to easily choose and add those labels directly into your project.

## Available Labels

* [General Labels](general/labels.md)
* [Dev Labels](dev/labels.md)
* [Priority Labels](priority/labels.md)

### Contribute Label ideas

[Contribution Guide](CONTRIBUTING.md)

## Installation

```bash
git clone https://github.com/esdc-devcop/label-generator.git
```

Double click `quicklaunch.bat`

## Requirements

In order to run the scripts in this project you will need to have all the dependencies installed.
You will also need to be able to provide information about the project you want to add the labels to.

### Details

#### GitHub details

* Personal access token https://github.com/settings/tokens


#### GitLab details

* Project ID or Group ID
   Found in Project > Settings > General > General project > Project ID
   Or Group > Settings > General > Naming, visibility > Group ID
* User Token  
   Needs to be created from User > Settings > Access Tokens  
   Give it a name and an expiry date if you want. Grant it the scope of api.

### Dependencies

* Git
* Powershell
* Curl