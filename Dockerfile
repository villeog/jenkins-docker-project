# Pull base image
From consol/tomcat-7.0

# Maintainer
MAINTAINER "villeog@yahoo.com"
COPY target/*.war /opt/tomcat/webapps
