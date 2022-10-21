## Setup

```bash

docker build --tag="ton-id-gen" ./gen_adnl_id/
docker build --tag="ton-proxy" ./proxy/
mkdir keyring
mkdir log
docker-compose run ton-id-gen
(echo ADNL_ADDRESS={ADNL_address_from_ton-id-gen_output} & echo IP_ADDRESS={host_ip_address}) > .env
docker-compose run ton-site
docker-compose run ton-proxy

```