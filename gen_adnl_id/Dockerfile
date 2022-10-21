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

FROM ubuntu:20.04 AS ton-generate-random-id
RUN apt-get update
RUN apt-get -y install zlib1g-dev libssl-dev
COPY --from=builder  /utils/generate-random-id /app/
COPY get_id.sh /
RUN chmod +x /get_id.sh
ENTRYPOINT ["/get_id.sh"]
