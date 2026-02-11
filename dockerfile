FROM tomcat:9.0-jdk17-temurin

RUN groupadd -r tomcat && useradd -r -g tomcat tomcat
# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

RUN chown -R tomcat:tomcat /usr/local/tomcat

# Copy WAR file as ROOT application
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

USER tomcat

EXPOSE 8080

CMD ["catalina.sh", "run"]
