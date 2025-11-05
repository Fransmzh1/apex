FROM fransmzh/ords:1.2-ps10

EXPOSE 8080

WORKDIR /opt/scripts
RUN rm WKS1.sql cr_user.sql setup_ords.sh
COPY scripts .
RUN mkdir startup

ENV SCRIPT_BASE="/opt/scripts"
ENV JAVA_OPTS="-Dconfig.url=/opt/ords_config"
ENV PATH="/opt/ords/bin:/opt/sqlcl/bin:$PATH"
ENV ORDS_CONFIG="/opt/ords_config"
ENV ORACLE_PWD=dukuhzamrud

CMD [ "bash","-c","/opt/scripts/runOrds.sh" ]
