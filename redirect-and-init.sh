#!/bin/bash

sysctl net.ipv4.ip_forward=1
for redirection in $@; do
    src_port=$(echo ${redirection} | cut -d':' -f1)
    dst_ip=$(echo ${redirection} | cut -d':' -f2)
    dst_port=$(echo ${redirection} | cut -d':' -f3)
    iptables -t nat -A PREROUTING -p tcp --dport ${src_port} -j DNAT --to-destination ${dst_ip}:${dst_port}
done
iptables -t nat -A POSTROUTING -j MASQUERADE

/init.sh
