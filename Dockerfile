FROM node:8-slim

RUN apt-get update \
  && apt-get -y install apt-transport-https 
RUN echo "deb http://http.debian.net/debian jessie-backports main" \
     | tee --append /etc/apt/sources.list.d/jessie-backports.list > /dev/null \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && rm -r /opt/yarn \
  && rm /usr/local/bin/yarn /usr/local/bin/yarnpkg \
  && apt-get update \
  && apt-get install -y -t jessie-backports\
       git \
       bzip2 \
       yarn \
       openjdk-8-jre \
       xvfb \
       chromium

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome \
  && ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser
