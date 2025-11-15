# fransmzh/dbxe:1.2-apex24210
FROM fransmzh/apexdb:1.0-apex24210

EXPOSE 1521

USER root
WORKDIR /opt/oracle
RUN mkdir dpdump && chown oracle:oinstall /opt/oracle/dpdump

USER oracle
WORKDIR /opt/oracle/scripts
ENV MBG_PWD=dukuhzamrud

COPY --chmod=764 --chown=oracle:oinstall scripts/cr_DIR.sh .
RUN ./cr_DIR.sh; rm cr_DIR.sh
COPY --chmod=764 --chown=oracle:oinstall script_workspace/01_cr_user.sh .
RUN ./01_cr_user.sh

COPY --chmod=764 --chown=oracle:oinstall script_workspace/02_WKS1.sql .
COPY --chmod=764 --chown=oracle:oinstall script_workspace/cr_wks1.sh .
RUN ./cr_wks1.sh && rm cr_wks1.sh 02_WKS1.sql
