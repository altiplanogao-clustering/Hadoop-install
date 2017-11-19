#!/bin/bash

hadoop_dirs=(${hadoop_conf_dir} ${hadoop_log_dir} ${namenode_dir} ${datanode_dir})
for hdp_dir in ${hadoop_dirs[*]}
do
	echo Process: ${hdp_dir}
	mkdir -p ${hdp_dir}
	chmod 0775 ${hdp_dir}
	# chown -R hadoop:${HADOOP_GROUP} ${hdp_dir}
done

echo COPY: cp -rf ${HADOOP_HOME}/etc/hadoop/* ${hadoop_conf_dir}
cp -rf ${HADOOP_HOME}/etc/hadoop/* ${hadoop_conf_dir}
cp ${hadoop_conf_dir}/mapred-site.xml.template ${hadoop_conf_dir}/mapred-site.xml

sed -i 's/^export JAVA_HOME=.*$/export JAVA_HOME='$(echo $JAVA_HOME | sed -e 's:\/:\\\/:g')'/g' ${hadoop_conf_dir}/hadoop-env.sh


ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
  chmod 0600 ~/.ssh/authorized_keys

sed -i 's/^#   StrictHostKeyChecking.*$/    StrictHostKeyChecking no/g' /etc/ssh/ssh_config
