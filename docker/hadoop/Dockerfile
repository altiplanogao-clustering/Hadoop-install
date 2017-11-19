FROM debian:stretch-backports

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
	&& apt-get install -y --no-install-recommends openjdk-8-jre-headless ca-certificates-java ssh rsync net-tools curl vim python

	# && rm -rf /var/lib/apt/lists/*

ENV HADOOP_VERSION 2.8.2

ARG install_path=/usr/lib/hadoop
ARG hadoop_conf_dir=/etc/hadoop
ARG hadoop_log_dir=/var/hadoop/log

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ \
	HADOOP_HOME=${install_path} \
	HADOOP_PREFIX=${install_path} \
	HADOOP_HDFS_HOME=${install_path} \
	HADOOP_YARN_HOME=${install_path} \
	HADOOP_MAPRED_HOME=${install_path} \
	HADOOP_CONF_DIR=${hadoop_conf_dir} \
	HADOOP_LOG_DIR=${hadoop_log_dir} \
	HDFS_LOG_DIR=${hadoop_log_dir} \
	YARN_LOG_DIR=${hadoop_log_dir} \
	HADOOP_MAPRED_LOG_DIR=${hadoop_log_dir} \
	PATH=${install_path}/bin/:$PATH

ADD . /docker-hadoop
RUN chmod +x /docker-hadoop/*.sh

## DOWNLOAD HADOOP BINARY and EXTRACT
RUN /bin/sh -c "/docker-hadoop/extract_hadoop.sh"

WORKDIR ${HADOOP_HOME}
RUN /bin/sh -c "/docker-hadoop/setup.sh"

#USER CONFIG DATA PLACEHOLDER
ENV HADOOP_CONF_DATA_PREDEF="" \
	HADOOP_CONF_DATA_PREDEF_FILE="" \
	HADOOP_CONF_DATA="" \
	HADOOP_CONF_DATA_FILE="" 

ENTRYPOINT ["/docker-hadoop/entrypoint.sh"]
