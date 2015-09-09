FROM centos:7

RUN rpm -i http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm && \
yum -y install mesos-0.23.0

ENV MESOS_WORK_DIR /tmp/mesos

VOLUME /tmp/mesos

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 5050
CMD ["/usr/sbin/mesos-master"]
