FROM ruby:latest
MAINTAINER www.maidailicai.com

# Set Version and Arch
ENV NODE_VERSION 0.10.32
ENV NODE_ARCH x64
WORKDIR /opt
# download tarball && checksum && unpack && clean
RUN curl -SLO https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$NODE_ARCH.tar.gz \
    && curl -SLO https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt \
    && grep node-v$NODE_VERSION-linux-$NODE_ARCH.tar.gz SHASUMS256.txt | sha256sum -c - \
    && tar -xzf node-v$NODE_VERSION-linux-$NODE_ARCH.tar.gz -C /usr/local/ --strip-components=1 \
    && rm -rf node-v$NODE_VERSION-linux-$NODE_ARCH.tar.gz SHASUMS256.txt

# install packages
RUN npm install -g grunt-cli bower \
    && gem update --system \
    && gem install compass

CMD ["node"]
