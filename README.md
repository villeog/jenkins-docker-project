Jenkins installation:

yum install java-11-amazon-corretto.x86_64 java-11-amazon-corretto-devel.x86_64 -y

if it is amazonlinux2  >   sudo amazon-linux-extras install java-openjdk11

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum install jenkins -y

sudo service jenkins start

-------------------------------------

# tomcatTomcat 7.0.57, 8091, "admin/admin" 

-----------------------------------------
build steps:

mvn clean package

sudo chmod 666 /var/run/docker.sock

# docker rm project -f

#  docker rmi project:1.0.0

docker build -t projectimage:1.0.0 .

docker run -d --name projectcontainer -p 8091:8080 projectimage:1.0.0

docker commit projectimage rajusw804/projectdockerhubrepo:$version

docker login --username ${dockerhubusername} --password ${dockerhubpassword}

docker push rajusw804/projectdockerhubrepo:$version



docker login --username ${dockerhubusername} --password ${dockerhubpassword}

docker push rajusw804/tomcat:$version

http://13.234.217.75:8080/github-webhook/
