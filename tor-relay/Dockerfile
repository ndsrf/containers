FROM alpine:latest

RUN apk add --no-cache tor 

EXPOSE 9050

VOLUME ["/etc/tor/torrc"]
VOLUME ["/var/lib/tor"]

#USER tor

#ENTRYPOINT ["tail", "-f", "/dev/null"]

ENTRYPOINT ["/usr/bin/tor", "--defaults-torrc",  "/usr/share/tor/tor-service-defaults-torrc",  "-f",  "/etc/tor/torrc", "--RunAsDaemon", "0"]
