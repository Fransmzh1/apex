FROM container-registry.oracle.com/database/express

ENV APX_PWD="Mustika_jay4"
ENV ORACLE_PWD=dukuhzamrud
EXPOSE 1521

WORKDIR /home/oracle
USER oracle
COPY --chmod=764 --chown=oracle:oinstall scripts/checkAPEXStatus.sh /opt/oracle
# copy source code APEX to container
COPY --chmod=764 --chown=oracle:oinstall apex /opt/oracle/scripts/apex
COPY --chmod=764 --chown=oracle:oinstall scripts/01_execApex.sh /opt/oracle/scripts/startup


# CMD ["/bin/bash", "-c", "/home/oracle/$RUN_FILE"]
HEALTHCHECK --interval=30s --timeout=15s --start-period=50s --retries=10 \
  CMD /opt/oracle/checkAPEXStatus.sh  || exit 1