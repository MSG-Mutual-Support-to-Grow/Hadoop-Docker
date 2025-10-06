# Base Hadoop image
FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

# Ensure volume directories exist
RUN mkdir -p /hadoop/dfs/name /hadoop/dfs/data

# Set environment variables
ENV CLUSTER_NAME=HadoopCluster
ENV CORE_CONF_fs_defaultFS=hdfs://localhost:9000

# Expose Hadoop Web UI + IPC ports
EXPOSE 9870 9000 9864

# Create volumes for namenode and datanode storage
VOLUME ["/hadoop/dfs/name", "/hadoop/dfs/data"]

# Copy startup script
COPY start-hadoop.sh /usr/local/bin/start-hadoop.sh
RUN chmod +x /usr/local/bin/start-hadoop.sh

# Run script when container starts
CMD ["/usr/local/bin/start-hadoop.sh"]
