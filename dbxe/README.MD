# Project (Dockerfile)

Minimal README to build and run the image produced by the repository Dockerfile.

## Description
This image is extension from Oracle database Express version from container-registry.oracle.com/database/express. 
It is added Oracle APEX version 24.2 patchset 10

## Prerequisites
- Docker Engine (>= 20.10)
- (Optional) docker-compose if using orchestration

## Build the image
From the repository root (where the Dockerfile lives):

```
docker build -t fransmzh/apexdb:1.2-ps10 .
```

## Run the container
Basic run:

```
docker run --name myapp -d <image-name>:<tag>
```

With ports, environment variables, and volumes:

```
docker run -d \
    --name myapp \
    -p 8080:80 \
    -e ENV_VAR_NAME=value \
    -v /host/path:/container/path \
    <image-name>:<tag>
```

Common flags:
- `-p HOST:CONTAINER` — map ports
- `-e KEY=VALUE` — set environment variables
- `-v HOST:CONTAINER` — mount persistent storage
- `--rm` — remove container after it stops
- `-it` — run interactively

## Docker Compose (optional)
Example `docker-compose.yml`:

```yaml
version: "3.8"
services:
    app:
        image: <image-name>:<tag>
        build: .
        ports:
            - "8080:80"
        environment:
            - ENV_VAR_NAME=value
        volumes:
            - ./data:/data
```

Start:
```
docker-compose up --build
```

## Environment Variables
Document any environment variables the container expects. Example:

- `PORT` — port the app listens on (default: 80)
- `APP_ENV` — runtime environment (development|production)

## Volumes / Persistence
List paths inside the container that should be persisted:
- `/data` — application data
- `/var/log/app` — logs

Use `-v` or a named volume in compose to persist data.

## Healthcheck
If the Dockerfile defines a HEALTHCHECK, verify with:
```
docker inspect --format='{{.State.Health.Status}}' <container>
```

## Logs & Debugging
Show logs:
```
docker logs -f <container>
```
Attach a shell:
```
docker exec -it <container> /bin/sh
# or
docker exec -it <container> /bin/bash
```

## Cleaning up
Remove image:
```
docker rm -f myapp
docker rmi <image-name>:<tag>
```

## Contributing
- Open issues for bugs or enhancements.
- Create pull requests for improvements.
- Keep Dockerfile small, secure, and with minimal layers.

## License
Add your project license or link to LICENSE file.

<!-- Replace placeholders (e.g. <image-name>, <tag>) with real values for your project. -->