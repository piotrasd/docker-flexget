FROM phusion/baseimage:0.9.11
MAINTAINER none
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody
RUN usermod -d /config nobody

ADD sources.list /etc/apt/
RUN apt-get update -qq && \
    apt-get install -qq --force-yes python git python-transmissionrpc && \
    apt-get autoremove && \
    apt-get autoclean

RUN curl -fsSL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
RUN pip install flexget
RUN pip install transmissionrpc

VOLUME /config
RUN ln -sf /config /root/.flexget

WORKDIR /opt/flexget
RUN python bootstrap.py
RUN bin/pip install -r jenkins-requirements.txt
RUN bin/pip install -r rtd-requirements.txt

# Add flexget to runit
#RUN mkdir /etc/service/flexget
#ADD flexget.sh /etc/service/flexget/run
#RUN chmod +x /etc/service/flexget/run

# Add flexget-webui to runit
RUN mkdir /etc/service/flexget-webui
ADD flexget-webui.sh /etc/service/flexget-webui/run
RUN chmod +x /etc/service/flexget-webui/run
