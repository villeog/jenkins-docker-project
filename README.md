Jenkins Docker & Terraform  Installation:

Take amazon-linux-2 instance

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

sudo amazon-linux-extras install java-openjdk11 epel -y

sudo yum install yum-utils awscli unzip maven git tree docker jenkins terraform -y

sudo systemctl start docker

sudo systemctl enable docker

sudo systemctl start jenkins

sudo systemctl enable jenkins

-------------------------------------

# tomcatTomcat 7.0.57, 8091, "admin/admin" 

-----------------------------------------
build steps:
mvn clean package

sudo chmod 666 /var/run/docker.sock

docker rmi projectimage:1.0.0 -f

docker rm projectcontainer --force

docker build -t projectimage:1.0.0 .

docker run -d --name projectcontainer -p 8091:8080 projectimage:1.0.0

docker commit projectcontainer rajulucky812/projectdockerhubrepo:$version

docker login --username ${dockerhubusername} --password ${dockerhubpassword}

docker push rajulucky812/projectdockerhubrepo:$version

