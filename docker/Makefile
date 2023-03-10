## Build

build:
	@docker build -t hadoop-namenode namenode/
	@docker build -t hadoop-datanode datanode/
	@docker build -t hadoop-resourcemanager resourcemanager/
	@docker build -t hadoop-nodemanager nodemanager/
	@echo "Build complete"

run:
	@docker run -d --name hadoop-namenode --network  hadoop --ip 172.20.0.10  -p 9870:9870 -p 9000:9000 hadoop-namenode
	@docker run -d --name hadoop-datanode --network  hadoop --ip 172.20.0.20 -p 9864:9864 -p 9866:9866 hadoop-datanode
	@docker run -d --name hadoop-resourcemanager --network  hadoop --ip 172.20.0.30  -p 8088:8088 -p 8030:8030 -p 8031:8031  -p 8032:8032 -p 8033:8033 hadoop-resourcemanager
	@docker run -d --name hadoop-nodemanager --network  hadoop --ip 182.20.0.40 -p 2222:22 hadoop-nodemanager
	@echo "Run complete"

stop:
	@docker rm -f hadoop-namenode
	@docker rm -f hadoop-datanode
	@echo "Stop complete"

push:
	# Create a new tag
	@docker image tag hadoop-namenode:latest 192.168.1.140:32000/hadoop-namenode:3.3.1
	@docker image tag hadoop-datanode:latest 192.168.1.140:32000/hadoop-datanode:3.3.1
	@docker image tag hadoop-resourcemanager:latest 192.168.1.140:32000/hadoop-resourcemanager:3.3.1
	@docker image tag hadoop-nodemanager:latest 192.168.1.140:32000/hadoop-nodemanager:3.3.1

	# Push the new tag
	@docker image push 192.168.1.140:32000/hadoop-namenode:3.3.1
	@docker image push 192.168.1.140:32000/hadoop-datanode:3.3.1
	@docker image push 192.168.1.140:32000/hadoop-resourcemanager:3.3.1
	@docker image push 192.168.1.140:32000/hadoop-nodemanager:3.3.1
	@echo "Push complete"

prune:
	@docker image prune -f
	@echo "Prune complete"

network:
	@docker network rm hadoop
	@docker network create --subnet=172.20.0.0/16 hadoop
	@echo "Network create complete"
