FROM ubuntu:20.04

RUN apt-get update -y
RUN apt-get install sudo -y && apt-get install iputils-ping -y
RUN apt-get install vim -y && apt-get install wget -y && apt-get install ssh -y
RUN apt-get install openjdk-8-jdk -y
RUN useradd -m hduser && echo "hduser:supergroup" | chpasswd && adduser hduser sudo && echo "hduser     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && cd /usr/bin/ && sudo ln -s python3 python

COPY ssh_config /etc/ssh/ssh_config

WORKDIR /home/hduser

USER hduser
RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
RUN tar zxvf hadoop-3.3.1.tar.gz && rm hadoop-3.3.1.tar.gz
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys

ENV HDFS_NAMENODE_USER hduser
ENV HDFS_DATANODE_USER hduser
ENV HDFS_SECONDARYNAMENODE_USER hduser

ENV YARN_RESOURCEMANAGER_USER hduser
ENV YARN_NODEMANAGER_USER hduser

ENV HADOOP_HOME /home/hduser/hadoop-3.3.1
ENV HADOOP_INSTALL $HADOOP_HOME
ENV HADOOP_MAPRED_HOME $HADOOP_HOME
ENV HADOOP_COMMON_HOME $HADOOP_HOME
ENV HADOOP_HDFS_HOME $HADOOP_HOME
ENV YARN_HOME $HADOOP_HOME
ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native

RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
COPY config/core-site.xml $HADOOP_HOME/etc/hadoop/
COPY config/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY config/yarn-site.xml $HADOOP_HOME/etc/hadoop/
COPY config/mapred-site.xml $HADOOP_HOME/etc/hadoop/

RUN mkdir -p /home/hduser/dfsdata/namenode
RUN mkdir -p /home/hduser/dfsdata/datanode

COPY entrypoint.sh entrypoint.sh

ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

EXPOSE 9864 9866 22

ENTRYPOINT ["/home/hduser/entrypoint.sh"]
