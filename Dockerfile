FROM ubuntu

MAINTAINER yenole <Netxy@vip.qq.com>

RUN apt-get update
RUN apt-get install -y git make gcc g++ libmysqlclient-dev libssl-dev python

RUN cd /usr/local/ && git clone https://git.oschina.net/likecg/kbengine.git
RUN chmod -R 755 /usr/local/kbengine && cd /usr/local/kbengine/kbe/src && make

RUN mkdir /usr/local/kbengine/scripts && cp -R /usr/local/kbengine/assets/*.sh /usr/local/kbengine/scripts

VOLUME ["/usr/local/kbengine/assets"]

EXPOSE 20013
EXPOSE 20015

CMD cd /usr/local/kbengine/assets && ./../scripts/start_server.sh && tail



