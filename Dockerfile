FROM node:8-slim

RUN echo "deb http://http.debian.net/debian jessie-backports main" | \
    tee --append /etc/apt/sources.list.d/jessie-backports.list > /dev/null \
  && apt-get update \
  && apt-get install -y -t jessie-backports\
       git \
       bzip2 \
       openjdk-8-jre \
       xvfb \
       chromium

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome \
  && ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser
