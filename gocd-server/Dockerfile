FROM quay.io/nordstrom/java:8
MAINTAINER maazghani@gmail.com

USER root
ENV GOCD_VERSION 17.8.0-5277
ENV GOCD_DISTR go-server.deb

# Install go.cd server
RUN curl -fSL https://download.gocd.io/binaries/${GOCD_VERSION}/deb/go-server_${GOCD_VERSION}_all.deb -o $GOCD_DISTR \
 && dpkg -i $GOCD_DISTR \
 && rm $GOCD_DISTR


# install git
RUN apt-get update && apt-get install -y \
    git-all \
 && rm -rf /var/lib/apt/lists/*

# store cruise-config.xml
ADD cruise-config.xml /tmp/

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8153 8154
CMD ["go-server"]
