FROM ubuntu:18.10

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -yq \
    wget \
    libjson-any-perl \
    ca-certificates \
    unzip \
    libdata-validate-ip-perl \
    libio-socket-ssl-perl \
    && rm -rf /var/lib/apt/lists/*

# Fetch and extract ddclient
ENV VERSION=3.9.0
RUN wget https://kent.dl.sourceforge.net/project/ddclient/ddclient/ddclient-$VERSION/ddclient-$VERSION.zip \
    && unzip ddclient-$VERSION.zip \
    && mv ddclient-$VERSION/ddclient /usr/bin \
    && mkdir /etc/ddclient \
    && mkdir /var/cache/ddclient\
    && rm -rf ddclient-$VERSION ddclient-$VERSION.zip

# Add config template
ADD ddclient.conf /etc/ddclient/ddclient.conf
RUN chmod 600 /etc/ddclient/ddclient.conf

# Setup entrypoint
ADD entrypoint.sh /entrypoint.sh
CMD [ "ddclient", "-foreground", "-debug", "-verbose", "-noquiet" ]
ENTRYPOINT [ "/entrypoint.sh" ]
