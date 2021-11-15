FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/azure \
    --with github.com/greenpau/caddy-auth-portal \
    --with github.com/greenpau/caddy-authorize

FROM caddy

RUN apk update && \
    apk upgrade && \
    rm -rf /var/cache/apk/*

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
