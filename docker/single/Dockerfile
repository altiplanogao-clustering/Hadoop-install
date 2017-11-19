FROM andy/hadoop:2.8.2

ENV CLUSTER_NAME=cluster-x
ENV HADOOP_CONF_DATA_PREDEF_FILE="/config_standalone.ini"
RUN mkdir -p /hadoop/dfs/namenode && mkdir -p /hadoop/dfs/datanode
VOLUME ["/hadoop/dfs/namenode", "/hadoop/dfs/datanode"]

ADD . /
RUN chmod a+x /run.sh

#50070 Namenode web ui
#50075 Datanode web ui
#8088 ResourceManager web ui
#8042 

EXPOSE 50070 50075 8088 10020 19888


CMD ["/run.sh"]
