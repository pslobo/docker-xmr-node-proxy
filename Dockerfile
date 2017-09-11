FROM ubuntu:16.04
LABEL maintainer="Pedro Lobo <https://github.com/pslobo>"
LABEL Name="Dockerized xmr-node-proxy"
LABEL Version="1.0"

    # Create a user for the proxy
RUN USER=proxy && \
    # groupadd -g 1000 ${USER} && \
    # useradd -b /app -M -g proxy -u 1000 ${USER} && \
    apt-get update && apt-get upgrade -qqy && \
    apt-get install --no-install-recommends -qqy cmake \
    build-essential git curl pkg-config \
    python-virtualenv python3-virtualenv ntp  \
    screen libboost-all-dev libevent-dev \
    libunbound-dev libminiupnpc-dev \
    libunwind8-dev liblzma-dev libldns-dev \
    libexpat1-dev libgtest-dev libzmq3-dev && \
    git clone https://github.com/Snipa22/xmr-node-proxy /app && \
    curl -o- https://deb.nodesource.com/setup_6.x| bash &&\
    apt-get install nodejs && \
    cd /app && npm install && \
    openssl req -subj "/C=IT/ST=Pool/L=Daemon/O=Mining Pool/CN=mining.proxy" \
    -newkey rsa:2048 -nodes -keyout cert.key -x509 -out cert.pem -days 36500 && \
    apt-get --auto-remove purge -qqy cmake curl git build-essential pkg-config && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R ${USER}. /app

USER proxy
WORKDIR /app

CMD ["node","proxy.js"]
