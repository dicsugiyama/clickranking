#!/bin/bash
#SSL証明書の更新スクリプト
DOMAIN='clickranking.dics.tokyo'
CURRENT_YEAR=`date +%Y`
CURRENT_MONTH=`date +%m`
mkdir -p /home/www/${DOMAIN}/sslcert/${CURRENT_YEAR}-${CURRENT_MONTH}
/home/admin/.acme.sh/acme.sh --install-cert -d ${DOMAIN} \
--key-file /home/www/${DOMAIN}/sslcert/${CURRENT_YEAR}-${CURRENT_MONTH}/key.pem \
--fullchain-file /home/www/${DOMAIN}/sslcert/${CURRENT_YEAR}-${CURRENT_MONTH}/fullchain.pem
#パスの張替
sed -i".bak" -e "s/\/sslcert\/[0-9]\{4\}-[0-9]\{2\}/\/sslcert\/${CURRENT_YEAR}-${CURRENT_MONTH}/g" /home/www/${DOMAIN}/nginx.conf 