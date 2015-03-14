FROM tomcat
MAINTAINER Romin Irani <romin.irani@mindstormsoftware.com>
ADD  app.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]