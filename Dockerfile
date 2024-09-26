# the base is taken from https://gitlab.torproject.org/tpo/anti-censorship/docker-obfs4-b

# Base docker image
FROM debian:bookworm-slim

LABEL org.opencontainers.image.source "https://github.com/steffsas/tor-docker" 

# Set to 101 for backward compatibility
ARG UID=1010
ARG GID=1010

RUN groupadd -g $GID debian-tor
RUN useradd -m -u $UID -g $GID -s /bin/false -d /var/lib/tor debian-tor

RUN printf "deb http://deb.debian.org/debian stable-backports main\n" >> /etc/apt/sources.list.d/backports.list
RUN apt-get update && apt-get install -y \
    tor \
    # backports allow us to install latest backport stable versions
    --no-install-recommends -t bookworm-backports

RUN mkdir -p /var/lib/tor/.tor/keys
RUN chown -R debian-tor:debian-tor /var/lib/tor
RUN chown debian-tor:debian-tor /etc/tor
RUN chown -R debian-tor:debian-tor /var/log/tor

USER debian-tor

ENTRYPOINT [ "tor" ]