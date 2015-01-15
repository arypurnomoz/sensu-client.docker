Requirements:
- ssl dir with cert.pem and key.pem
- CLIENT_ADDRESS, RABBITMQ_HOST and SUB env

```sh
docker run \
  -v /ssl:/ssl \
  -e CLIENT_ADDRESS=ip \
  -e CLIENT_NAME=name \
  -e RABBITMQ_HOST=ip \
  -e RABBITMQ_PORT=4567 \
  -e RABBITMQ_USER=sensu \
  -e RABBITMQ_PASS=sensu \
  -e SUB=metrics,check \
  arypurnomoz/sensu-client \
  '
    "additional": "client-info"
  '
````
