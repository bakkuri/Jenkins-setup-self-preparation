#Update your Linux system

sudo yum install epel-release
sudo yum update
sudo reboot

# Install Java

cd /opt/
sudo yum install java-1.8.0-openjdk.x86_64
java -version
openjdk version "1.8.0_91"
OpenJDK Runtime Environment (build 1.8.0_91-b14)
OpenJDK 64-Bit Server VM (build 25.91-b14, mixed mode)
sudo cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/opt/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/opt/jre' | sudo tee -a /etc/profile
source /etc/profile
echo $JAVA_HOME
echo $JRE_HOME


#Install Jenkins


cd /opt
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/
sudo rpm --import https://pkg.jenkins.io.key
yum install jenkins
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload


#End of the File
