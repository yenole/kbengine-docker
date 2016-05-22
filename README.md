# KBEngine Docker

## 有问题反馈
在使用中有任何问题，欢迎反馈给我，也可以用以下联系方式跟我交流

* 邮件(Netxy#vip.qq.com, 把#换成@)
* QQ: 850265689

## 构建镜像

```
git clone https://github.com/itspas/kbengine_docker.git

cd kbengine_docker

docker build -t yenole/kbengine .

```

## 运行服务器
```
# 新建容器
docker run -d --kbe --link mysql:db -p 20013:20013 -p 20015:20015 -v /var/kbe/assets:/usr/local/kbengine/assets kbengine

# 运行已有的容器
docker start kbe

# 关闭
docker exec -it kbe /bin/bash
cd /usr/local/kbengine/assets/ && ./../scripts/safa_kill.sh && exit
docker stop kbe

# 重启
docker exec -it kbe /bin/bash
cd /usr/local/kbengine/assets/ && ./../scripts/safa_kill.sh && ./../scripts/start_server.s
```

## 注意
```
# 修改/var/kbe/assets/res/server/kbengine.xml
<baseapp>
    <backupPeriod> 500 </backupPeriod>
	<externalAddress> 服务器地址 </externalAddress>
</baseapp>
```