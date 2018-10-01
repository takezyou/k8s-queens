FROM centos:7

MAINTAINER KaitoAkita <kaitokun07@icloud.com>

# Queens
RUN yum update & yum -y install centos-release-openstack-queens
RUN sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-OpenStack-queens.repo
RUN  yum -y install centos-release-openstack-queens epel-release
RUN  yum -y install openstack-packstack python-pip

CMD [packstack --allinone]
