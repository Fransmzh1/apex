FROM tomcat:9.0.111-jdk21-corretto-al2

EXPOSE 8080

WORKDIR /opt
RUN mkdir ords ords_config
RUN chmod 777 ords_config
COPY ords_codes ords
COPY setup_ords.sh /opt
RUN chmod 774 setup_ords.sh
# COPY ords_config ords_config
# COPY sqlcl sqlcl

WORKDIR /usr/local/tomcat
RUN mkdir webapps/i
COPY images webapps/i
RUN cp -r webapps.dist/* webapps 
RUN cp /opt/ords/ords.war webapps

# remote access manager page by admin/Welcome1
COPY context.xml webapps/manager/META-INF  
COPY tomcat-users.xml conf   

ENV JAVA_OPTS="-Dconfig.url=/opt/ords_config"
ENV PATH="/opt/ords/bin:$PATH"
ENV ORDS_CONFIG="/opt/ords_config"

