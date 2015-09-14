FROM ruby:latest
MAINTAINER www.maidailicai.com

# Set Version and Arch
ENV NODE_VERSION 0.10.32
ENV NODE_ARCH x64

# download tarball && checksum && unpack && clean
RUN curl -SLO https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${NODE_ARCH}.tar.gz \
	&& curl -SLO https://nodejs.org/dist/v${NODE_VERSION}/SHASUMS256.txt \
	&& grep node-v${NODE_VERSION}-linux-${NODE_ARCH}.tar.gz SHASUM256.txt | sha256sum -c - \
	&& tar -xzf node-v${NODE_VERSION}-linux-${NODE_ARCH}.tar.gz -C /usr/local/bin \
    && rm -rf node-v${NODE_VERSION}-linux-${NODE_ARCH}.tar.gz SHASUM256.txt

### deal with the GFW  ###
# cnpm is an alias of npm which set --registry to http://registry.npm.taobao.org
COPY cnpm /usr/local/bin/cnpm
# change gem source
RUN gem sources --remove https://rubygems.org/ \
	&& gem sources -a https://ruby.taobao.org/

# install packages
RUN cnpm install -g grunt-cli bower \
	&& gem update --system \
	&& gem install compass
CMD ["node"]
