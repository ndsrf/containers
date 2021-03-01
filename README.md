# List of useful containers for a Raspberry pi
Containers on my raspberry pi swarm, a pi4 (master) and pi3 (worker).

List of containers you would end up with: 
![a sample list of containers as shown in portainer](https://github.com/ndsrf/containers/blob/main/Screenshot%202021-03-01%20095624.png?raw=true "Containers in Portainer")

This assumes a docker swarm with master on 192.168.1.150 and another one (slave) on 192.168.1.151.

The docker swarm: 
![a sample list of containers as shown in portainer](https://github.com/ndsrf/containers/blob/main/Screenshot%202021-03-01%20095732.png?raw=true "Swarm - only shows services...")

These are the services I have at home:

## Portainer

Portainer is container management made easy, a web interface to interact with docker 
so it is easier to see what is going on.

[Website](https://www.portainer.io/)

## Traefik

This is an inverse proxy. We will have a lot of services, we need a way to tell docker swarm
that http://pihole.local should end up in the pihole container, but http://portainer.local should be redirected to portainer.
Traefik does that.

[Website](https://traefik.io/)

## InfluxDB

Influxdb is a time series database designed to handle high write and query loads. We will use it to track
metrics from other containers, such as the temperature one or the pihole one.

[Website](https://www.influxdata.com)

For each service that needs an influx DB database you need to create a database for it. Portainer > Go to influx db and then to "container console":

```
root@a9b44934cd4b:/# influx
Connected to http://localhost:8086 version 1.8.0
InfluxDB shell version: 1.8.0
> create database telegrafdb
> create user telegraf with password 'telegraf'
> grant write on telegrafdb to telegraf
> 
```

## Pihole

Pihole is an adblock (blocks advertisements) based on DNS. It provides a DNS server that answers 0.0.0.0
for all those DNS queries that would end up on a server serving advertisements otherwise. This means pihole
blocks ads across all apps, all clients across your network, particularly if you set the raspberry pi as the
DNS server for DHCP in your router.

[Website](https://pi-hole.net)

## HomeAssistant

Homeassistant is a server to manage all your home appliances and create rules based on "IF ... THEN...",
for example, turn the lights on when you come in, or turn on the camera alarm when you leave home.

[Website](https://www.home-assistant.io/)

## Tor Relay

This is a relay to use part of your bandwidth to contribute to the tor network (as a relay - not an exit
node).

[Website](https://www.eff.org/es/pages/what-tor-relay)

## Tor Proxy

This is a small container to add tor proxy capabilities inside your network. That way if you need to
use tor sporadically (HTTP/S traffic only) you can just use your raspberry as proxy and that's it. It uses
polipo as the proxy.

Use the instructions here: <https://github.com/jpaffrath/docker-rpi-torproxy>

## Grafana

This is a site to create dashboards easily, you can add charts based on metrics. We wil use it to
display the metrics from InfluxDB.

[Website](https://grafana.com/)

## Monitor Pihole in Grafana

This is a container to monitor how Pihole is doing in Grafana.

Setup info here: <https://gitlab.com/janw/pi-hole-influx>

## Monitor Temperature in Grafana

A container to track temperature and humidity - you need a separate sendor for that (a DHT22 sensor).

This is the DHT22 sensor I used: <https://www.amazon.es/gp/product/B078SVZB1X/ref=ppx_yo_dt_b_asin_title_o01_s00?ie=UTF8&psc=1>

Useful diagram and some ideas on containers: <https://github.com/allthingsclowd/docker_rpi3_python_iot_api_dht_11_22>

The Python script I used comes from <https://github.com/adelorenzo/dht22_sensor_python>

This container needs to run in privileged mode to access the GPIO, you can create and run the container with the following:

```
docker image build --tag ndsrf/templogger -f Dockerfile .
docker container run --name templogger --privileged --network monitoring2 ndsrf/templogger
```

I haven't managed to get it working with the monitoring network I used everywhere else - so I created a monitoring2 network just for this one (and influxdb).

This container runs in the pi3 - worker node.

## Wireguard

A VPN server - so you can connect to your network from anywhere in the world!

[Website](https://www.wireguard.com/)

I used this container image <https://hub.docker.com/r/linuxserver/wireguard>, pulling from ghcr.io/linuxserver/wireguard

## Telegraf

Extract details about how the raspberry pi is doing.

## Monitor - speed check

I use this one to monitor my network speed https://github.com/gonzalo123/speed, it requires InfluxDB.
