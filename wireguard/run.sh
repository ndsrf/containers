docker run \
  --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Madrid \
  -e SERVERURL=YOUR.EXTERNALIP.DOMAIN.COM \
  -e SERVERPORT=51820 \
  -e PEERS=3 \
  -e PEERDNS=192.168.1.150 \
  -e INTERNAL_SUBNET=10.13.13.0 \
  -p 51820:51820/udp \
  -v ./config:/config \
  -v /lib/modules:/lib/modules \
  -v /usr/src:/usr/src \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  ghcr.io/linuxserver/wireguard
