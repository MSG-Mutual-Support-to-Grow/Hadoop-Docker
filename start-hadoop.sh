#!/bin/bash

# Format namenode if not already formatted
if [ ! -d "/hadoop/dfs/name/current" ]; then
  echo "Formatting NameNode..."
  hdfs namenode -format -force
fi

# Start NameNode
echo "Starting NameNode..."
$HADOOP_HOME/bin/hdfs --daemon start namenode

# Start DataNode
echo "Starting DataNode..."
$HADOOP_HOME/bin/hdfs --daemon start datanode

# Keep container alive
tail -f /dev/null
