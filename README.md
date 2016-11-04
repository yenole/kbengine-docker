# KBEngine Docker

## 有问题反馈
在使用中有任何问题，欢迎反馈给我，也可以用以下联系方式跟我交流

* 邮件(Netxy#vip.qq.com, 把#换成@)
* QQ: 850265689

## 构建镜像

```
git clone https://github.com/yenole/kbengine-docker.git

cd kbengine-docker

docker build -t yenole/kbengine .

```

## 运行服务器
```
# 新建容器

# 运行已有的容器

# 关闭
docker exec -it kbe /bin/bash
cd /var/lib/kbengine/assets/ && ./safa_kill.sh && exit
docker stop kbe

# 重启
docker exec -it kbe /bin/bash
cd /var/lib/kbengine/assets/ && ./safa_kill.sh && ./start_server.sh
```

## 注意
```
# 修改/var/kbe/assets/res/server/kbengine.xml
<baseapp>
    <backupPeriod> 500 </backupPeriod>
	<externalAddress> 服务器地址 </externalAddress>
</baseapp>
```
