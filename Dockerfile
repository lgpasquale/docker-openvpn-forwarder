FROM lgpasquale/openvpn-client:latest

COPY redirect-and-init.sh /redirect-and-init.sh
RUN chmod +x /redirect-and-init.sh

ENTRYPOINT ["/redirect-and-init.sh"]
