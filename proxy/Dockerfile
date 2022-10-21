FROM ubuntu:20.04 AS builder
RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install git cmake g++ zlib1g-dev libssl-dev
RUN git clone --recurse-submodules https://github.com/ton-blockchain/ton.git
RUN mkdir build
RUN cd build
RUN cmake ../ton -DCMAKE_BUILD_TYPE=Release
RUN make -j 8 rldp-http-proxy
RUN make -j 8 generate-random-id

FROM ubuntu:20.04 AS ton-proxy
RUN apt-get update
RUN apt-get -y install zlib1g-dev libssl-dev wget
COPY --from=builder  /rldp-http-proxy/rldp-http-proxy /app/
RUN cd /app/ && wget https://ton-blockchain.github.io/global.config.json
RUN mkdir /keyring
RUN mkdir /app/log
COPY start_proxy.sh /
RUN chmod +x /start_proxy.sh
ENTRYPOINT ["/start_proxy.sh"]