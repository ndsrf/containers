# containers
Containers on my raspberry pi.

This assumes a docker swarm with master on 192.168.1.150 and another one (slave) on 192.168.1.151.

It will install the following services:

## Portainer

Portainer is container management made easy, a web interface to interact with docker 
so it is easier to see what is going on.

[Website]: https://www.portainer.io/

## Traefik

This is an inverse proxy. We will have a lot of services, we need a way to tell docker swarm
that http://pihole.local should end up in the pihole container, but http://portainer.local should be redirected to portainer.
Traefik does that.

[Website]: https://traefik.io/

## InfluxDB

Influxdb is a time series database designed to handle high write and query loads. We will use it to track
metrics from other containers, such as the temperature one or the pihole one.

[Website]: https://www.influxdata.com/

## Pihole

Pihole is an adblock (blocks advertisements) based on DNS. It provides a DNS server that answers 0.0.0.0
for all those DNS queries that would end up on a server serving advertisements otherwise. This means pihole
blocks ads across all apps, all clients across your network, particularly if you set the raspberry pi as the
DNS server for DHCP in your router.

[Website]: https://pi-hole.net/

## HomeAssistant

Homeassistant is a server to manage all your home appliances and create rules based on "IF ... THEN...",
for example, turn the lights on when you come in, or turn on the camera alarm when you leave home.

[Website]: https://www.home-assistant.io/

## Tor Relay

This is a relay to use part of your bandwidth to contribute to the tor network (as a relay - not an exit
node).

[Website]: https://www.eff.org/es/pages/what-tor-relay

## Tor Proxy

This is a small container to add tor proxy capabilities inside your network. That way if you need to
use tor sporadically (HTTP/S traffic only) you can just use your raspberry as proxy and that's it.

## Grafana

This is a site to create dashboards easily, you can add charts based on metrics. We wil use it to
display the metrics from InfluxDB.

[Website]: https://grafana.com/

## Monitor Pihole in Grafana

This is a container to monitor how Pihole is doing in Grafana.

## Monitor Temperature in Grafana

A container to track temperature and humidity - you need a separate sendor for that (a DHT22 sensor).

[This is the sendor I used]: https://www.amazon.es/gp/product/B078SVZB1X/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1

## Wireguard

A VPN server - so you can connect to your network from anywhere in the world!

[Website]: https://www.wireguard.com/
