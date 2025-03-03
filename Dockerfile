FROM tomcat:10.0
COPY target/LibrabySarvlet.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh","run"]