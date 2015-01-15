#!/bin/sh

ADDITIONAL_INFO=",$*"

if [ -z "$CLIENT_ADDRESS" ]; then
  echo "\$CLIENT_ADDRESS must be provided" 
  exit 1
fi

if [ -z "$SUB" ]; then
  echo "\$SUB must be provided" 
  exit 1
fi

if [ -z "$RABBITMQ_HOST" ]; then
  echo "\$RABBITMQ_HOST must be provided" 
  exit 1
fi

SUBSCRIPTIONS="`echo $SUB|sed s/,/\\",\\"/g`"

cat << EOF > /etc/sensu/config.json
{
  "client": {
      "name": "$CLIENT_ADDRESS",
      "address": "$CLIENT_ADDRESS",
      "subscriptions": ["$SUBSCRIPTIONS"],
      "socket": {
        "bind":"0.0.0.0",
        "port":3030
      }
      $ADDITIONAL_INFO
  },
  "rabbitmq": {
    "ssl": {
      "cert_chain_file": "/ssl/cert.pem",
      "private_key_file": "/ssl/key.pem"
    },
    "host": "$RABBITMQ_HOST",
    "port": $RABBITMQ_PORT,
    "vhost": "/sensu",
    "user": "$RABBITMQ_USER",
    "password": "$RABBITMQ_PASS"
  }
}
EOF

echo "Running sensu config:"
cat /etc/sensu/config.json

exec /usr/bin/supervisord
