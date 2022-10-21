#!/bin/bash
echo Server IP: $SERVER_IP
echo Webserver: $WEB_SERVER_IP:$WEB_SERVER_PORT
echo ADLN address: $ADNL_ADRESS
echo LOG path: $LOG
echo Config path: $CONFIG

/app/rldp-http-proxy -a $SERVER_IP:3333 -R '*'@$WEB_SERVER_IP:$WEB_SERVER_PORT -C $CONFIG -A $ADNL_ADRESS -d -l $LOG
echo Done!