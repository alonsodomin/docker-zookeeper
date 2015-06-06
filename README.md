# Docker Zookeeper

Docker Container holding an instance of [Apache Zookeeper](https://zookeeper.apache.org)

# Starting the container

To start the container just run following command:

```
docker run -d --name some_zookeeper alonsodomin/zookeeper
```

# Custom configuration

To provide with a custom configuration file you can mount the configuration folder as volume in
your host using following command:

```
docker run -d --name some_zookeeper -v /path/to/my/conf:/etc/zookeeper alonsodomin/zookeeper
```

