FROM tomcat:9.0

EXPOSE 8080

WORKDIR /opt
RUN mkdir ords_config
RUN mkdir ords
COPY executable ords
# COPY ords_config ords_config
COPY sqlcl sqlcl

WORKDIR /usr/local/tomcat
RUN mkdir webapps/i
RUN cp -r webapps.dist/* webapps 
RUN cp /opt/ords/ords.war webapps

# COPY setenv.sh bin
#COPY ords.war webapps
COPY i webapps/i
# remote access manager page by admin/Welcome1
COPY context.xml webapps/manager/META-INF  
COPY tomcat-users.xml conf   

ENV JAVA_OPTS="-Dconfig.url=/opt/ords_config"

