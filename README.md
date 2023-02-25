# loquegasto-infra

# Requirements
1. Docker Engine
2. Repositories downloaded with the following folder structure:
    ```
    .
    |___loquegasto-infra
    |___loquegasto-backend
    |___loquegasto-telegram
    ```

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

# Autostart
1. Create a service in systemd
   ```
   sudo nano /etc/systemd/system/loquegasto.service
   ```
2. Add the following content to the file
   ```
   [Unit]
   Description=LoQueGasto Docker Compose Service
   Requires=docker.service
   After=docker.service
   
   [Service]
   Type=oneshot
   RemainAfterExit=true
   WorkingDirectory=/path/to/docker-compose
   ExecStart=/usr/bin/docker compose up -d
   ExecStop=/usr/bin/docker down
   
   [Install]
   WantedBy=multi-user.target
   
   ```
3. Enable service
   ```
   sudo systemctl enable loquegasto.service
   ```
4. Reboot
5. Check if service is running
   ```
   sudo systemctl status loquegasto.service
   ```