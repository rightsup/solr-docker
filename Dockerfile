FROM    java:openjdk-8-jre
MAINTAINER  Rights Up "it@rightsup.com"

ENV SOLR_VERSION 4.10.4
ENV SOLR solr-$SOLR_VERSION
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get -y install lsof

RUN mkdir -p /opt && \
  wget -nv --output-document=/opt/$SOLR.tgz http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  ln -s /opt/$SOLR /opt/solr

EXPOSE 8983
WORKDIR /opt/solr
CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]
