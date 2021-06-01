FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

USER root

RUN mv /home/eduk8s/workshop /opt/workshop

RUN HOME=/root && \
    dnf install -y --setopt=tsflags=nodocs go

RUN fix-permissions /home/eduk8s

USER 1001
