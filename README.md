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
   
# Metrics
1. Download Grafana image
   ```
   docker pull grafana/grafana-oss
   ```
2. Create volume for persistance
   ```
   docker volume create grafana-storage
   ```
3. Run Grafana image
   ```
   docker run -d -p 3000:3000 --name=grafana -v grafana-storage:/var/lib/grafana grafana/grafana-oss
   ```
4. Download Prometheus image
   ```
   docker pull prom/prometheus
   ```
5. Run Prometheus with the config file
   ```
   docker run -d -p 9090:9090 -v prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
   ```