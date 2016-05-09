CICD Pipeline 

Run the script  for installation:
sh jenkins.sh
  install ation of jenkins
plugin will be installed autometically
    github
    elastic beanstalk

Script will configure infra with github and jenkin CICD 

As per the security i have removed AWS access key / secret key and git password please create new one and configure plugin.

AWS Securty Keys:
http://<jenkinsurl:8080>/configure
select the 'Deploy into AWS Elastic Beanstalk' at bottom and put the AWS Keys
Github credentials need to pass manually in console 
http://<jenkins-URL>/job/bcus-cicd/configure 
  	Source Code Management --> add credentials 





    
