#!/bin/bash

 package_installation () {
  yum install -y vim net-tools git
  wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
  yum -y install apache-maven

  wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
  rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
  yum -y install jenkins

  yum -y remove java
  yum -y install java-1.7.0-openjdk
  sudo yum install java-1.7.0-openjdk-devel
  service jenkins start
}

 initial_dir_setup() {
  mkdir -p /opt/jenkins
   rm -rf /opt/jenkins/ruby-app/.git
  git clone https://github.com/krishna-xebia/krishna-cicd.git /opt/jenkins/krishna-cicd 
  chown -R jenkins:jenkins  /opt/jenkins/

}

 setup_jenkins_cli() {
  sleep 2m
  wget localhost:8080/jnlpJars/jenkins-cli.jar -O /opt/jenkins/jenkins-cli.jar
}

 create_initial_jobs() {
  java -jar /opt/jenkins/jenkins-cli.jar -s http://localhost:8080/ create-job "bcus-cicd" <  /opt/jenkins/krishna-cicd/bcus-cicd.xml

}

 install_jenkins_plugins(){
  java -jar /opt/jenkins/jenkins-cli.jar  -s http://localhost:8080/ install-plugin github
  java -jar /opt/jenkins/jenkins-cli.jar  -s http://localhost:8080/ install-plugin awseb-deployment-plugin
  java -jar /opt/jenkins/jenkins-cli.jar  -s http://localhost:8080/ install-plugin aws-beanstalk-publisher-plugin
  sleep 15
  service jenkins stop
  service jenkins start
}

package_installation
sleep 5
initial_dir_setup
sleep 5
setup_jenkins_cli
sleep 5
create_initial_jobs
sleep 5
install_jenkins_plugins 
