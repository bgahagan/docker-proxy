# Docker OpenVPN Proxy

Creates a docker container running a Squid http proxy and connected to a PrivateInternetAccess OpenVPN endpoint.

### Build
```
sudo docker build -t proxy .
```

### Run
```
sudo docker run -e OPENVPN_CLIENT=client-uk -it -p 3128:3128 --cap-add=NET_ADMIN --name proxy-uk proxy
```

## A note on DNS

The container needs to do a dns lookup outside of the vpn (to look up the vpn server) and inside the vpn once its connected.

By default docker uses dns settings of the host, so if your default dns resolver in not publicly availiable (e.g. its the router on your home network) then you'll need to tell docker to use a public dns resolver.

Add the following options to the docker run command (or add them to DOCKER_OPTS in in /etc/default/docker):

```
--dns 8.8.8.8 --dns 8.8.4.4 --dns-search=.
```

