# Tomcat 8 is latest version where jdk 8 is default. Xplanner fails with version 9 where jdk 11 is default
FROM tomcat:8
ENV TZ=Europe/Copenhagen

COPY ./build/libs/xplanner-*.war /usr/local/tomcat/webapps/ROOT.war


