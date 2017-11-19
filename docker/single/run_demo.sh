#!/bin/bash

# NameNode - http://localhost:50070/
# ResourceManager - http://localhost:8088/
echo "================================================="
echo "===       RUN DEMO       ========================"
echo "================================================="
echo "=== dfs -mkdir /user             ================"
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user
echo "=== dfs -mkdir /user/mapred      ================"
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/root
echo "=== dfs -put $HADOOP_PREFIX/etc/hadoop input  ==="
$HADOOP_PREFIX/bin/hdfs dfs -put $HADOOP_PREFIX/etc/hadoop input
echo "=== Run demo                    ================="
$HADOOP_PREFIX/bin/hadoop jar $HADOOP_PREFIX/share/hadoop/mapreduce/hadoop-mapreduce-examples-${HADOOP_VERSION}.jar grep input output 'dfs[a-z.]+'
echo "=== Cat result                  ================="
$HADOOP_PREFIX/bin/hdfs dfs -cat output/*
