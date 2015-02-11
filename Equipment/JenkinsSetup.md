Install the jenkens init script (jenkins.sh) in /etc/init.d

Add a jenkins user to github jenkins:S0ftw@r3
Add a jenkins user to debauchery jenkins:jenkins

Add ssh capability for jenkins on our github (google adding ssh access to github)

Jenkins runs on debauchery at port 8080.  Web browse to 10.22.72.220:8080 to access jenkins control portal.

Install git plugin in jenkins
Add AUC project to jenkins
Configure AUC project as shown in JenkinsAUCconfig.png.  Edit the Execute Shell field to call the appropriate build scripts.

