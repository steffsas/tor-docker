# this is taken from https://gitlab.torproject.org/tpo/anti-censorship/docker-obfs4-b

# Base docker image
FROM debian:stable-slim

# Set to 101 for backward compatibility
ARG UID=101
ARG GID=101

# LABEL maintainer="meskio <meskio@torproject.org>"

RUN groupadd -g $GID debian-tor
RUN useradd -m -u $UID -g $GID -s /bin/false -d /var/lib/tor debian-tor

RUN printf "deb http://deb.debian.org/debian stable-backports main\n" >> /etc/apt/sources.list.d/backports.list
RUN apt-get update && apt-get install -y \
    obfs4proxy \
    tor \
    tor-geoipdb \
    libcap2-bin \
    --no-install-recommends
    # -t stable-backports

RUN chown debian-tor:debian-tor /etc/tor
RUN chown debian-tor:debian-tor /var/log/tor

USER debian-tor

ENTRYPOINT [ "tor" ]