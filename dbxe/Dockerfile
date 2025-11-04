FROM container-registry.oracle.com/database/express

EXPOSE 1521

USER oracle
WORKDIR /opt/oracle/scripts
COPY --chmod=764 --chown=oracle:oinstall apex apex
COPY --chmod=764 --chown=oracle:oinstall scripts/* .
COPY --chmod=764 --chown=oracle:oinstall patchset10 patchset10

ENV APX_PWD=Mustika_jay4
ENV ADMIN_PWD=Mustika_123
ENV ORACLE_PWD=dukuhzamrud

RUN ./setup_apex.sh
RUN ./upgrade_apex.sh
RUN rm -r patchset10
RUN rm -r apex
RUN rm upgrade_apex.sh
RUN rm setup_apex.sh
