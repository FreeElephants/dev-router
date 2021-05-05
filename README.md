#  Development Router

Automated Reverse Proxy for local docker services. 

Based on https://github.com/nginx-proxy/nginx-proxy. 

## Usage:

```
make install
make run
```

1. Add to upstream service docker-compose configuration:
```yaml
version: "3.7"

services:
  some-service:
    networks:
      dev-router:
      default:
    environment:
      - VIRTUAL_HOST=some-service.local
```

2. Add to service domain to `/etc/hosts`
```
127.0.0.1   some-service.local
```

Now you can open your service from host at http://some-service.local. 
