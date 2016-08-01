This image connects to an openvpn and allows to forward ports from the docker container to specific hosts in the vpn.

The container looks for a *.conf file in /etc/openvpn, therefore such a file should be mounted as an external volume.

Ports to be forwarded are specified as arguments to the `docker run` command as `conatiner_port:dst_ip:dst_port`

This image needs `--cap-add=NET_ADMIN` to work.

For example:
```
docker run -d --name openvpn-forwarder \
    --cap-add=NET_ADMIN \
    -p 2222:22 \
    lgpasquale/openvpn-forwarder \
    22:192.168.0.10:22
```
