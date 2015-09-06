FROM ubuntu:14.04
RUN apt-get update && apt-get install -qqy python python-dev python-pip
RUN pip install pyzmq supervisor aliyuncli awscli
CMD ["/bin/bash"]
