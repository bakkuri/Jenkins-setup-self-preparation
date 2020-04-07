#make Directory in /opt directory
mkdir /opt/java
#goto /java directory
cd /opt/java
#install wget and download latest version of java by using oracle 
Yum install wget -y
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/14+36/076bab302c7b4508975440c56f6cc26a/jdk-14_linux-x64_bin.tar.gz
#Extract by using tar
tar -zxvf jdk-14_linux-x64_bin.tar.gz
#Select appropriate version if multiple versions exists
update-alternatives --config java
#Export java path to recognize java
export JAVA_HOME=/opt/java/jdk-14/
export PATH=$PATH:/opt/java/jdk-14/bin
#run below command to confirm java installation
java –version

#Install Jenkins
# To enable the Jenkins repository import the GPG key using the following curl command:
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

#Add the repository to your system with:
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
#Before install Jenkins need to change directory to /usr/bin to give access to our system to recognize Jenkins commands
#now install by using yum
sudo yum install Jenkins
sudo systemctl start Jenkins
systemctl status Jenkins
sudo systemctl enable Jenkins

#If you are installing Jenkins on a remote CentOS server that is protected by a firewall you need to open port 8080
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
