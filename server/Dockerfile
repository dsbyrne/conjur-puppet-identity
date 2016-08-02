FROM centos:7


RUN rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
RUN yum -y install puppetserver
RUN useradd -g puppet puppet && \
    mkdir -p /etc/puppetlabs/puppet/ssl && \
    chown puppet /etc/puppetlabs/puppet/ssl && \
    chown puppet /var/log/puppetlabs/puppetserver && \
    touch /var/log/puppetlabs/puppetserver/masterhttp.log && \
    chown puppet /var/log/puppetlabs/puppetserver/masterhttp.log

COPY puppetserver /etc/sysconfig/puppetserver
COPY autosign.conf /etc/puppetlabs/puppet

COPY conjur-conjur-0.0.4.tar.gz /tmp/conjur.tar.gz
RUN /opt/puppetlabs/bin/puppet module install /tmp/conjur.tar.gz

WORKDIR /etc/puppetlabs/code/environments/production
COPY production/manifests manifests
COPY production/modules/conjur/files/conjur.pem modules/conjur/files

RUN chown -R puppet modules/conjur/files

CMD /opt/puppetlabs/bin/puppetserver foreground

WORKDIR /
EXPOSE 8140
