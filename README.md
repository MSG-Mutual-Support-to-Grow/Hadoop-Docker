
# 📘 Hadoop in Docker (Standalone)

This repository provides a **ready-to-use Hadoop setup** (NameNode + DataNode) inside a **single Docker container**.
Perfect for beginners, labs, and quick experimentation without installing Hadoop manually.

---

## ✅ Pre-requisites

Make sure the following are installed on your system before running:

* [Docker](https://docs.docker.com/get-docker/) (version **20+ recommended**)
* [Git](https://git-scm.com/) (for cloning the repository if building from source)
* At least **2 GB RAM free** for the container
* Internet connection (to pull the image from DockerHub or download the base image)

---

## 🔧 Building from Source (Optional)

If you prefer to build the image locally (for customization, offline use, or contributing):

1. **Clone the repository**

   ```bash
   git clone https://github.com/MSG-Mutual-Support-to-Grow/Hadoop-Docker.git
   cd Hadoop-Docker
   ```

2. **Build the Docker image**

   ```bash
   docker build -t ronnieallen/myhadoop .
   ```

Then proceed to the Quick Start section below.

---

## 🚀 Quick Start

1. **Pull the image from DockerHub**

   ```bash
   docker pull ronnieallen/myhadoop
   ```

2. **Run the container**

   ```bash
   docker run -d --name hadoop \
     -p 9870:9870 -p 9000:9000 -p 9864:9864 \
     -v hadoop_namenode:/hadoop/dfs/name \
     -v hadoop_datanode:/hadoop/dfs/data \
     ronnieallen/myhadoop
   ```

3. **Access Hadoop UIs**

   * NameNode (File System Master): [http://localhost:9870](http://localhost:9870)
   * DataNode (Storage Node): [http://localhost:9864](http://localhost:9864)

---

## 📂 How it Works

* **NameNode** manages file system metadata (which blocks belong to which file).
* **DataNode** stores the actual file blocks.
* Both run **inside the same container** (pseudo-distributed mode).
* **Volumes** (`hadoop_namenode`, `hadoop_datanode`) ensure data persists even if the container stops.
* **Ports** are mapped so you can access Hadoop Web UIs from your browser.

---

## 🛠️ Basic HDFS Commands

Open a shell inside the container:

```bash
docker exec -it hadoop bash
```

Now you can use Hadoop commands:

* Create a directory in HDFS:

  ```bash
  hdfs dfs -mkdir /test
  ```

* Put a local file into HDFS:

  ```bash
  hdfs dfs -put /etc/hosts /test/
  ```

* List files in HDFS:

  ```bash
  hdfs dfs -ls /test
  ```

* Read a file from HDFS:

  ```bash
  hdfs dfs -cat /test/hosts
  ```

---

## 🧹 Stopping & Cleaning Up

* Stop the container:

  ```bash
  docker stop hadoop
  ```

* Remove the container:

  ```bash
  docker rm hadoop
  ```

* Remove volumes (⚠️ deletes stored data):

  ```bash
  docker volume rm hadoop_namenode hadoop_datanode
  ```

---

## 📌 Notes

* This setup is **standalone (pseudo-distributed mode)** – not a real multi-node cluster.
* For a full distributed Hadoop cluster (one NameNode + multiple DataNodes across machines), consider **Docker Compose** or **Kubernetes**.

---
### Made with ❤️ by Ronnie Allen
