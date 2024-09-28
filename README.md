Jenkins Docker & Terraform  Installation:

Take amazon-linux-2023 instance  - 4 GB RAM

sudo yum install -y java-11-amazon-corretto

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum install -y jenkins

sudo systemctl start jenkins

sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

sudo yum install yum-utils awscli unzip maven git tree docker terraform -y

sudo systemctl start docker

sudo systemctl enable docker

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

docker commit projectcontainer nagesh525/projectdockerhubrepo:$version

docker login --username ${dockerhubusername} --password ${dockerhubpassword}

docker push nagesh525/projectdockerhubrepo:$version

