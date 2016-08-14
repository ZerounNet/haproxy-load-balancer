FROM centos

MAINTAINER ZerounNet

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN yum -y update && \
    yum -y install haproxy && \
    yum clean all && \
    chmod u+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy-systemd-wrapper", "-f", "/etc/haproxy/haproxy.cfg", "-p", "/run/haproxy.pid"]
