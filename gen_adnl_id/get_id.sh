#!/bin/bash
# Gen adnl id and copy to keyring dir
mkdir /keyring
cd /keyring
/app/generate-random-id -m adnlid
echo Done!