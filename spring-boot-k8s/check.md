```sh
while true;do ./request-my-service.sh; sleep 0.1; done
```

```sh
# cat request-my-service.sh
curl 10.0.1.1:8888/api/v1/health
```
