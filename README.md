# Usage:

Community plugins is installed in /community dir. 

Gem installed:
- docker
- etcd
- redis

Requirements:
- ssl dir with cert.pem and key.pem
- CLIENT_NAME, CLIENT_ADDRESS, RABBITMQ_HOST, SUB

```sh
docker run \
  -v /ssl:/ssl \
  -e CLIENT_ADDRESS=10.0.0.1 \
  -e CLIENT_NAME=sensu-client \
  -e RABBITMQ_HOST=rabbitmq.local \
  -e RABBITMQ_PORT=5671 \
  -e RABBITMQ_USER=sensu \
  -e RABBITMQ_PASS=sensu \
  -e SUB=metrics,check \
  arypurnomoz/sensu-client \
  ' \
    "additional": "client-info" \
  ' \
```

The arguments will be the additional info for client, it must be a json object without the outer braces.

The example below will generate:

```
{
  "rabbitmq": {
    "ssl": {
      "cert_chain_file": "/ssl/cert.pem",
      "private_key_file": "/ssl/key.pem"
    },
    "host": "rabbitmq.local",
    "port":5671,
    "vhost": "/sensu",
    "user": "sensu",
    "password": "sensu"
  },
  "client": {
    "name": "sensu-client",
    "address": "10.99.0.10",
    "subscriptions": ["metrics", "check"],
    "socket": {
      "bind":"0.0.0.0",
      "port":3030
    },
    "additional": "client-info"
  }
}
```
