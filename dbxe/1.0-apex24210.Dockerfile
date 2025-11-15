# fransmzh/dbxe:1.0-apex24210
FROM container-registry.oracle.com/database/express

EXPOSE 1521

USER oracle
WORKDIR /opt/oracle/scripts
COPY --chmod=764 --chown=oracle:oinstall apex apex
COPY --chmod=764 --chown=oracle:oinstall patchset10 patchset10
COPY --chmod=764 --chown=oracle:oinstall scripts/* .

ENV _APX_PWD=Mustika_jay4
ENV _ADMIN_PWD=Mustika_123
ENV ORACLE_PWD=dukuhzamrud
ENV PDB_NAME=XEPDB1

RUN ./setup_apex.sh; 
RUN ./upgrade_apex.sh

RUN mv upd_admin_pwd.sh extensions/startup
RUN rm -r patchset10
RUN rm -r apex
RUN rm upgrade_apex.sh
RUN rm setup_apex.sh

