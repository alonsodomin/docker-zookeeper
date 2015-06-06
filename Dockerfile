FROM java:7-jre

MAINTAINER Antonio Alonso Dominguez <alonso@codenibbles.com>

ENV ZOOKEEPER_VERSION 3.4.6
ENV ZOOKEEPER_HOME /opt/zookeeper

RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz | tar -xzf - -C /opt && \
    mv /opt/zookeeper-$ZOOKEEPER_VERSION /opt/zookeeper && \
	rm -f /opt/zookeeper/conf/zoo_sample.cfg && \
    mv /opt/zookeeper/conf /etc/zookeeper && \
	ln -s /etc/zookeeper /opt/zookeeper/conf && \
    mkdir -p /var/lib/zookeeper

COPY conf/* /etc/zookeeper/

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/etc/zookeeper", "/var/lib/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
