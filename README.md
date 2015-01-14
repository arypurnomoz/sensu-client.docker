```sh`
docker run \
  # ssl dir should contain cert.pem and key.pem
  -v /ssl:/ssl \
  -e CLIENT_ADDRESS=ip \
  -e SUB=metrics,check \
  registy.skydns/sensu-client \
  "additional": "client-info"
````
