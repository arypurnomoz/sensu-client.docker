```sh`
docker run \
  # ssl dir should contain cert.pem and key.pem
  -v /ssl:/ssl \
  -v /log:/log \
  -e CLIENT_ADDRESS=ip \
  -e SUB=metrics,check \
  arypurnomoz/sensu-client \
  '
    "additional": "client-info"
  '
````
