Automatic CICD Pipeline:

Automation Script: 

name: jenkins.sh

How its work:

Fetch the code from github with the help github plugin and web hook

downtime will be zero, elastic beanstalk deployment with one server at a time

As per the security have removed AWS access key / secret key and git password.

Adding AWS Securty Keys :

http://<jenkinsurl:8080>/configure
    
    select the 'Deploy into AWS Elastic Beanstalk' at bottom and put the AWS Keys

Github credentials need to pass manually in console 

http://<jenkins-URL>/job/bcus-cicd/configure 
  
    Source Code Management --> add credentials
  	
