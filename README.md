# loquegasto-infra

# Run
```
docker compose up --build -d
```
_Note: On MacOS you must set `DOCKER_BUILDKIT=0` before the command as mentioned [here](https://stackoverflow.com/a/66695181)._

# Check containers
```
docker ps
```

# Watch stdout of a container
```
docker logs -f <container_id>
```
