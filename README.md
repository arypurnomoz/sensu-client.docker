Requirements:
- ssl dir with cert.pem and key.pem
- CLIENT_ADDRESS, RABBITMQ_HOST and SUB env

```sh
docker run \
  # ssl dir should contain cert.pem and key.pem
  -v /ssl:/ssl \
  -v /log:/log \
  -e CLIENT_ADDRESS=ip \
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
