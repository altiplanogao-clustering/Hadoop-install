#!/bin/sh
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user
$HADOOP_PREFIX/bin/hdfs dfs -mkdir /user/mapred
$HADOOP_PREFIX/bin/hdfs dfs -put $HADOOP_PREFIX/etc/hadoop input
$HADOOP_PREFIX/bin/hadoop jar $HADOOP_PREFIX/share/hadoop/mapreduce/hadoop-mapreduce-examples-$HADOOP_VERSION.jar grep input output 'dfs[a-z.]+'
$HADOOP_PREFIX/bin/hdfs dfs -cat output/*