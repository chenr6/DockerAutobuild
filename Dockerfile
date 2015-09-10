FROM ubuntu:14.04
RUN apt-get update && apt-get install -qqy python python-dev python-pip
RUN pip install pyzmq supervisor aliyuncli awscli
RUN uname -a
RUN wget https://download.elastic.co/logstash/logstash/logstash-1.5.4.tar.gz -O - |cat 
RUN df -h
RUN dd if=/dev/zero bs=81920 count=12500000 of=/root/1Gb.file
CMD ["/bin/bash"]
