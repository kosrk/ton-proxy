## Setup

```bash

docker build --tag="ton-id-gen" ./gen_adnl_id/
docker build --tag="ton-proxy" ./proxy/
mkdir keyring
mkdir log
docker-compose run --name ton-id-gen ton-id-gen
(echo ADNL_ADDRESS={ADNL_address_from_ton-id-gen_output} & echo IP_ADDRESS={host_ip_address}) > .env
docker-compose run --name ton-site ton-site
docker-compose run --name ton-proxy ton-proxy

```