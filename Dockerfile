FROM debian:latest

ENV RABBITMQ_PORT 4567
ENV SENSU_USER admin
ENV SENSU_PASS admin

ADD http://repos.sensuapp.org/apt/pubkey.gpg /tmp/pubkey.gpg

RUN \
  apt-key add /tmp/pubkey.gpg \
  && echo 'deb http://repos.sensuapp.org/apt sensu main' > /etc/apt/sources.list.d/sensu.list \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y sensu ruby ruby-dev build-essential git supervisor \
  && gem install sensu-plugin etcd --no-rdoc --no-ri \
  && git clone git://github.com/sensu/sensu-community-plugins.git /etc/sensu/community
  
ADD run.sh /tmp/run.sh
ADD supervisor.conf /etc/supervisor/conf.d/sensu.conf

EXPOSE 3030

ENTRYPOINT ["/tmp/run.sh"]
