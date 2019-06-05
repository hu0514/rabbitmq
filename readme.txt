1.镜像构建
docker build -t rabbitmq:3.7.15 .
2 容器运行
docker run -d \
    --name rabbitmq \
	--network host \
	--hostname rabbitmq.test.com \
	-v /data:/data \
	-e RABBITMQ_USER=admin \
	-e RABBITMQ_PASS=admin \
	18817810841/rabbitmq:3.7.15 
在不指定rabbitmq_user,rabbitmq_pass的情况下使用默认账号密码（guest1:guest1）
-v /data:/data将数据目录和日志目录挂载到本地 数据目录为/data/rabbitmq/mnesia 日志目录为/data/rabbitmq/log