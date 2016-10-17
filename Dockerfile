FROM ubuntu

MAINTAINER yenole <Netxy@vip.qq.com>

# 替换阿里源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
ADD sources.list /etc/apt/sources.list

# 更新并安装环境
RUN apt-get update
RUN apt-get install -y make gcc g++ libmysqlclient-dev libssl-dev python unzip

# 导入KBEngine和编译
ADD KBEngine.zip /usr/local/KBEngine.zip
RUN unzip /usr/local/KBEngine.zip -d /usr/local && chmod -R 755 /usr/local/kbengine && cd /usr/local/kbengine/kbe/src && make

# 复制出脚本
RUN mkdir /usr/local/kbengine/scripts && cp -R /usr/local/kbengine/assets/*.sh /usr/local/kbengine/scripts

# 服务器脚本和资源挂载目录
VOLUME ["/usr/local/kbengine/assets"]

# 映射端口
EXPOSE 20013
EXPOSE 20015

ENTRYPOINT cd /usr/local/kbengine/assets/ && ./../scripts/start_server.sh && tail -f



