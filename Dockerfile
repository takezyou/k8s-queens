FROM centos:7

MAINTAINER KaitoAkita <kaitokun07@icloud.com>

# Queens
RUN yum install -y https://www.rdoproject.org/repos/rdo-release.rpm
RUN yum -y update
RUN  yum -y install centos-release-openstack-queens epel-release
RUN  yum -y install openstack-packstack python-pip

# Queens Open Ports
EXPOSE 22

CMD packstack --allinone
