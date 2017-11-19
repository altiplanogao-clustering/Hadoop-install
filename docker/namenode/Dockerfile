FROM andy/hadoop:2.8.2

ENV CLUSTER_NAME=cluster-x
ENV HADOOP_CONF_DATA_PREDEF_FILE="/config_namenode.ini"
RUN mkdir -p /hadoop/dfs/namenode && mkdir -p /hadoop/dfs/datanode
VOLUME ["/hadoop/dfs/namenode", "/hadoop/dfs/datanode"]

ADD . /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
