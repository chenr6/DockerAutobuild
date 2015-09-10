FROM ubuntu:14.04
RUN apt-get update && apt-get install -qqy python python-dev python-pip
RUN pip install pyzmq supervisor aliyuncli awscli
RUN uname -a
RUN wget https://download.elastic.co/logstash/logstash/logstash-1.5.4.tar.gz -O - |cat 
RUN dd if=/dev/zero of=./file bs=4m count=10240
CMD ["/bin/bash"]
