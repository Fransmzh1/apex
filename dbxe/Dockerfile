FROM container-registry.oracle.com/database/express

ENV APX_PWD=Mustika_jay4
ENV ADMIN_PWD=Admin_321
ENV ORACLE_PWD=dukuhzamrud
EXPOSE 1521

WORKDIR /home/oracle
USER oracle
COPY --chmod=764 --chown=oracle:oinstall apex /opt/oracle/scripts/apex
COPY --chmod=764 --chown=oracle:oinstall scripts /opt/oracle/scripts
COPY --chmod=764 --chown=oracle:oinstall patchset10 /opt/oracle/scripts/patchset10

RUN /opt/oracle/scripts/setup_apex.sh
RUN /opt/oracle/scripts/upgrade_apex.sh
RUN rm -r /opt/oracle/scripts/patchset10
RUN rm -r /opt/oracle/scripts/apex
