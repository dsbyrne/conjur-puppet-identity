FROM centos:7

RUN rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
RUN yum -y install puppet-agent

COPY puppet.conf /etc/puppetlabs/puppet/puppet.conf

CMD /opt/puppetlabs/bin/puppet agent --no-daemonize --server puppet --waitforcert 10
