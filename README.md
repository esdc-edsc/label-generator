# ESDC Labels
Defining groups of labels that can be imported to other projects for commonality within the department.

## Avaliable Labels
* [Gerneral Labels](gerneral/labels.md)
* [Dev Labels](dev/labels.md)

## Instalation
```
git clone https://gccode.ssc-spc.gc.ca/iitb-dgiit/esdc-labels.git
```

Double click `quicklaunch.bat`

## Requirements
In order to run the scripts in this project you will need to have all the depenancies installed. 
You will also need to be able to provide information about the project you want to add the labels to.

### Project info
*  Project ID  
   Found in Project > Settings > Gerneral > Gernal project > Project ID  
*  User Token  
   Needs to be created from User > Settings > Access Tokens  
   Give it a name and an expiry date if you want. Grant it the scope of api.

### Depenancies
*  Git
*  Powershell
*  Curl