FROM tomcat:9.0.111-jdk21-corretto-al2

EXPOSE 8080

WORKDIR /opt
RUN mkdir ords ords_config sqlcl scripts
RUN chmod 777 ords_config
COPY ords_codes ords

WORKDIR /usr/local/tomcat
RUN mkdir webapps/i
COPY images webapps/i
# RUN cp -r webapps.dist/* webapps 
RUN cp /opt/ords/ords.war webapps

# remote access manager page by admin/Welcome1
# COPY context.xml webapps/manager/META-INF  
# COPY tomcat-users.xml conf   

WORKDIR /opt
COPY setup_ords.sh .
COPY sqlcl sqlcl
COPY scripts scripts
RUN chmod 774 setup_ords.sh

ENV JAVA_OPTS="-Dconfig.url=/opt/ords_config"
ENV PATH="/opt/ords/bin:/opt/sqlcl/bin:$PATH"
ENV ORDS_CONFIG="/opt/ords_config"
ENV ORACLE_PWD=dukuhzamrud

CMD [ "bash","-c","/opt/scripts/setup_ords.sh" ]