#!/usr/bin/env bash

sudo service ssh start

if [ ! -f "/home/hduser/dfsdata/namenode_formated.txt" ]; then
        $HADOOP_HOME/bin/hdfs namenode -format
        echo $(date) >> /home/hduser/dfsdata/namenode_formated.txt
fi

$HADOOP_HOME/bin/hdfs namenode