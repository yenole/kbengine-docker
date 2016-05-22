FROM ubuntu

MAINTAINER yenole <Netxy@vip.qq.com>

# 更新并安装环境
RUN apt-get update
RUN apt-get install -y git make gcc g++ libmysqlclient-dev libssl-dev python

# 获取KBEngine和编译
RUN cd /usr/local/ && git clone https://git.oschina.net/likecg/kbengine.git
RUN chmod -R 755 /usr/local/kbengine && cd /usr/local/kbengine/kbe/src && make

# 复制出脚本
RUN mkdir /usr/local/kbengine/scripts && cp -R /usr/local/kbengine/assets/*.sh /usr/local/kbengine/scripts

# 服务器脚本和资源挂载目录
VOLUME ["/usr/local/kbengine/assets"]

# 映射端口
EXPOSE 20013
EXPOSE 20015

CMD cd /usr/local/kbengine/assets && ./../scripts/start_server.sh && tail



