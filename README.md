# docker-vector-logrotate

Docker image using Vector for automatic container log collection. Collects logs from all Docker containers via Docker socket, writes zstd-compressed logs organized by container name and date.

## Quick Start

```bash
docker compose up -d --build
```

## Features

- Collects logs from all Docker containers automatically
- Organizes logs by container name and date (`/logs/{container_name}/{date}.log.zst`)
- Zstd compression for efficient storage
- Simple deployment with docker-compose

## Configuration

Logs are written to `../docker-logs` relative to the project directory. Modify `docker-compose.yml` to change the output location.
