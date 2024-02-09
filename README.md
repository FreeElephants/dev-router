#  Development Router

Automated Reverse Proxy and virtual hosts for local docker services.

## Usage:

```
make install
make run
```

1. Add to upstream service docker-compose configuration:
```yaml
services:
  some-service:
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.some-service.rule=Host(`some-service.local`)"
      - "traefik.http.routers.some-service.entrypoints=web"
```

2. Add virtual host name to `/etc/hosts`
```
127.0.0.1   some-service.local
```

Now you can open your service from host at http://some-service.local. 
