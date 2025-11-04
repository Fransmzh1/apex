FROM tomcat:9.0.111-jdk21-corretto-al2

EXPOSE 8080

WORKDIR /opt
RUN mkdir ords ords_config sqlcl scripts patch10_images
RUN chmod 777 ords_config
COPY ords_codes ords
COPY patch10_images patch10_images
COPY sqlcl sqlcl
COPY scripts scripts

WORKDIR /usr/local/tomcat
RUN cp /opt/ords/ords.war webapps
RUN mkdir webapps/i
COPY images webapps/i
RUN cp -rf /opt/patch10_images/* webapps/i
RUN rm -r /opt/patch10_images

ENV JAVA_OPTS="-Dconfig.url=/opt/ords_config"
ENV PATH="/opt/ords/bin:/opt/sqlcl/bin:$PATH"
ENV ORDS_CONFIG="/opt/ords_config"
ENV ORACLE_PWD=dukuhzamrud

CMD [ "bash","-c","/opt/scripts/setup_ords.sh" ]