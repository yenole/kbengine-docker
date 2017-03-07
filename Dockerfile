FROM ubuntu

MAINTAINER yenole <Netxy@vip.qq.com>

# 替换阿里源
# RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
# ADD sources.list /etc/apt/sources.list

# 更新并安装环境
RUN apt-get update
RUN apt-get install -y libmysqlclient20 telnet

# 环境变量
ENV KBE_DT 10s
ENV KBE_ROOT /var/lib/kbengine
ENV KBE_RES_PATH $KBE_ROOT/kbe/res/:$KBE_ROOT/assets:$KBE_ROOT/assets/res/:$KBE_ROOT/assets/scripts/
ENV KBE_BIN_PATH $KBE_ROOT/kbe/bin/server/

# 服务器脚本和资源挂载目录
VOLUME ["/var/lib/kbengine/"]

# 设置工作目录
WORKDIR /var/lib/kbengine/assets

# 映射端口
EXPOSE 20013
EXPOSE 20015

# 添加脚本
ADD start.sh /start.sh
# 添加执行权限
RUN chmod 777 /start.sh

CMD /start.sh



