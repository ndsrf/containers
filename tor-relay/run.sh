#!/bin/bash
docker run -d --name tor-relay \
  -p 127.0.0.1:9050:9050 \
  -p 9001:9001 \
  -p 9030:9030 \
  -p 127.0.0.1:9051:9051 \
  -v ./torrc:/etc/tor/torrc:ro \
  -v /etc/localtime:/etc/localtime \
  -v ./tor-data:/var/lib/tor \
  --restart unless-stopped \
  ndsrf/tor-relay:latest
