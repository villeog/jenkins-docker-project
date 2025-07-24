# Pull base image
From consol/tomcat-7.0

# Maintainer
MAINTAINER "villiers118@yahoo.com"
COPY target/*.war /opt/tomcat/webapps
